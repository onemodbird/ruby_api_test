require "grape-swagger"
require "benchmark"

class ApiSerializer

  def self.call(resource, env)
    # If Active Record validations fail, send error JSON instead of resource
    if resource.is_a?(ActiveRecord::Base) && !resource.valid?
      raise ActiveRecord::RecordInvalid.new(resource)
    end
    Grape::Formatter::ActiveModelSerializers.call(resource, env)
  end

end

class ApiManager < Grape::API
  prefix "v1"

  format :json
  formatter :json, ApiSerializer

  # Helpers mixed in to Grape contexts

  helpers do
    def included_params
      declared(params, include_missing: false)
    end

    def p
      included_params
    end

    def current_user
      @current_user ||= params[:auth_token].present? ?
        User.for_auth_token(params.delete(:auth_token)) : nil
    end

    def logged_in?
      current_user.present?
    end

    def require_user!
      error!({ error: "Unauthorized" }, 403) unless logged_in?
    end

    def require_vifadmin!
      unless logged_in? && current_user.vifadmin?
        error!({ error: "Unauthorized" }, 403)
      end
    end

    def require_superuser!
      unless logged_in? && current_user.superuser?
        error!({ error: "Unauthorized" }, 403)
      end
    end

    def fetch_serializer(resource)
      Grape::Formatter::ActiveModelSerializers.fetch_serializer(resource, env)
    end

    def serialize(resource)
      fetch_serializer(resource).as_json
    end

    def raise_outside_of_dev!
      unless (Rails.env.test? || Rails.env.development?)
        error!({ error: "Endpoint not available in this environment" }, 403)
      end
    end

    def measure(stats_hash, key_to_add, &block)
      if Secrets.measurements
        result = nil

        b = Benchmark.measure { result = block.call }
        stats_hash[key_to_add] = b.real

        return result
      else
        block.call
      end
    end
  end

  # Before/after filters
  after do
    # Track any requested events, don't allow failure to halt response
    begin
      Tracking.grape_track(current_user, request)
    rescue => e
      ErrorNotification.notify(e, error_message: "Grape tracking failure")
    end
  end

  # Error handling

  rescue_from Grape::Exceptions::ValidationErrors do |e|
    msg = e.message.gsub(/\w+\[(\w+)\]/, "\1").capitalize
    error!({ error: e, error_message: msg }, 400)
  end

  rescue_from ActiveRecord::RecordInvalid do |error|
    error! error.record.errors.full_messages.first, 400
  end

  rescue_from CanCan::AccessDenied do |e|
    error!({ error: "Unauthorized" }, 403)
  end

  rescue_from Elasticsearch::Transport::Transport::Errors::NotFound, ActiveRecord::RecordNotFound do |e|
    log! e
    error!({ error: "Not found" }, 404)
  end

  rescue_from :all do |e|
    ErrorNotification.notify(e, error_message: "API exception")
    error!({ error: "Internal server error :(" }, 500)
  end

  # Mount all API modules

  mount Appo::Api::Analytics
  mount Appo::Api::Articles
  mount Appo::Api::Assignments
  mount Appo::Api::Autocomplete
  mount Appo::Api::Badges
  mount Appo::Api::BadgeAssertions
  mount Appo::Api::Bookmarks
  mount Appo::Api::ChangeLogs
  mount Appo::Api::Chats
  mount Appo::Api::ChatInvitations
  mount Appo::Api::Collaborations
  mount Appo::Api::Collections
  mount Appo::Api::CollectionGroups
  mount Appo::Api::CollectionResources
  mount Appo::Api::Comments
  mount Appo::Api::ContentBlocks
  mount Appo::Api::Dashboard
  mount Appo::Api::Feedback
  mount Appo::Api::Home
  mount Appo::Api::LibraryResources
  mount Appo::Api::Notifications
  mount Appo::Api::Organizations
  mount Appo::Api::Passwords
  mount Appo::Api::QASessions
  mount Appo::Api::Realtime
  mount Appo::Api::Resources
  mount Appo::Api::Reviews
  mount Appo::Api::Searches
  mount Appo::Api::Sessions
  mount Appo::Api::Schedules
  mount Appo::Api::ScheduledMessages
  mount Appo::Api::Subscriptions
  mount Appo::Api::Transcripts
  mount Appo::Api::Users
  mount Appo::Api::Vif

  if Secrets.swagger
    add_swagger_documentation(
      api_version: "v1",
      hide_documentation_path: true,
      mount_path: "swagger_doc",
      hide_format: true
    )
  end
end

module Grape
  module Middleware
    class Error

      def log!(exception, environments = ["development"])
        if environments.include?(Rails.env.to_s)
          p exception
          p exception.backtrace.first(3)
        end
      end

    end
  end
end

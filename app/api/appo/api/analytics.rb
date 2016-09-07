module Appo
  module Api
    class Analytics < Grape::API
      resources :analytics do

        desc "Track an event"

        params do
          requires :event, type: String, allow_blank: false
          optional :data, type: Hash, default: {}

          optional :anonymous_id, type: String, allow_blank: false
          optional :auth_token, type: String, allow_blank: false
          at_least_one_of :auth_token, :anonymous_id
        end

        post do
          require_user! if p.anonymous_id.blank?

          Tracking.track p.event,
            user: current_user,
            anonymous_id: p.anonymous_id,
            request: request,
            data: p.data
        end
      end
    end
  end
end

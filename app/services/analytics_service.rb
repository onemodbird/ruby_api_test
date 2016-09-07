require "segment"

class AnalyticsService
  class TestClient
    attr_accessor :events

    def initialize
      @events = []
    end

    def clear_events
      @events.clear
    end

    [:identify, :track, :page].each do |event_type|
      define_method(event_type) { |data| @events << OpenStruct.new(type: event_type, data: data) }
    end
  end

  def initialize(api_key, enabled = true)
    if @enabled = enabled
      @client = Segment::Analytics.new({
        write_key: api_key,
        on_error: Proc.new { |status, msg| Logger.error "Segment.io error, status: #{status} msg: #{msg}" },
        max_queue_size: 10000,
        batch_size: 100
      })
    else
      @client = TestClient.new
    end
  end

  # For spec usage
  def events
    @client.events
  end

  # For spec usage
  def clear_events
    @client.clear_events
  end

  def identify(user, request = nil)
    payload = payload_for(user)
    payload[:context] = request_params(request) if request.present?

    @client.identify(payload)
  end

  def page(user, name, request = nil)
    @client.page(
      user_id: user.id,
      name: name,
      timestamp: Time.now,
      properties: request_params(request)
    )
  end

  # Used for initial user load
  def load_async(user_id)
    id = user_id.is_a?(String) ? user_id : user_id.id
    AnalyticsLoadJob.perform_async(user_id)
  end

  def load(user)
    last_visited_at = user.last_sign_in_at || user.created_at
    payload = payload_for(user, last_visited_at: last_visited_at)

    @client.identify(payload)
    @client.page(
      user_id: user.id,
      name: "/sessions",
      timestamp: last_visited_at)
  end

  def track(event_name, user: nil, anonymous_id: nil, request: nil, data: {})
    return :not_tracked unless user || anonymous_id

    @client.track(
      user_id: user&.id,
      anonymous_id: anonymous_id,
      event: event_name,
      properties: data.merge({ email: user&.email }),
      context: request_params(request)
    )
  end

  # Use to specify event tracking on a grape route. Data can be specified as a string with
  # dot operators seperating bits of a nested hash.
  #
  # Examples
  # route_setting :track, event: :say_hello, data: [:thing]
  # route_setting :track, event: :another_event, data: ["top_level.next_level", "top_level.another"]
  def grape_track(current_user, request)
    tracking = request.env["rack.routing_args"][:route_info].route_settings[:track] rescue {}

    if tracking.present? and tracking[:event].present?

      data = {}

      ([tracking[:data]] || []).flatten.each do |field|
        data[field] = field.to_s.split(".").inject(request.params) do |hash, part|
          hash = hash[part]
          hash
        end
      end

      track(tracking[:event], user: current_user, request: request, data: data)
    end
  end

  private

  def payload_for(user, trait_override = {})
    {
      user_id: user.id,
      timestamp: user.created_at,
      traits: {
        email: user.email,
        name: user.name,
        first_name: user.first_name,
        created_at: user.created_at,
        last_visited_at: Time.now,
        lc_legacy: user.viflearn_user_id.present?,
        cet: user.flags["cet"] == true
      }.merge(trait_override)
    }
  end

  def request_params(request)
    request.present? ? { userAgent: request.user_agent, ip: request.ip } : {}
  end
end

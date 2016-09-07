RSpec.configure do |config|
  config.before :each do |example|
    Tracking.clear_events
  end
end

module Appo
  module Test
    module TrackingHelpers
      def expect_identify(traits: {}, user_id: )
        event = Tracking.events.detect do |event|
          event.type == :identify &&
          event[:data][:user_id] == user_id &&
          event[:data][:traits] >= traits
        end

        unless event
          raise "Identify not found\nEvents:#{Tracking.events}"
        end
      end

      def expect_tracking(event_name, data: {}, user_id: nil, anonymous_id: nil)
        event = Tracking.events.detect do |event|
          event.type == :track &&
          event[:data][:event]&.to_sym == event_name.to_sym &&
          event[:data][:user_id] == user_id &&
          event[:data][:anonymous_id] == anonymous_id &&
          event[:data][:properties] >= data
        end

        unless event
          raise "Event not found: #{event_name}\nEvents:#{Tracking.events}"
        end
      end

      def get_tracked_event(event_name)
        Tracking.events.detect do |event|
          event.type == :track &&
          event[:data][:event]&.to_sym == event_name.to_sym
        end
      end
    end
  end
end

class PusherTriggerJob
  include Sidekiq::Worker
  sidekiq_options queue: :realtime

  def perform(channel_names, event_name, payload)
    Pusher.trigger(channel_names, event_name, payload)
  end
end

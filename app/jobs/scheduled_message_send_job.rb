class ScheduledMessageSendJob
  include Sidekiq::Worker
  sidekiq_options queue: :tweets, retry: 1 # Only retry once (between 15 and 45 seconds late)

  def perform(scheduled_message_id)
    @scheduled_message = ScheduledMessage.find(scheduled_message_id)

    if @scheduled_message.sendable?
      send_message
      send_realtime_update if @scheduled_message.user?
    else
      fail! @scheduled_message.sendable_errors.join(", ")
    end
  end

  def send_message
    begin
      response = client.update(@scheduled_message.text, upload_media)

      @scheduled_message.completed_at = Time.now
      @scheduled_message.tweet_id = response.id.to_s
      @scheduled_message.save(validate: false)
    rescue => e
      fail! e.to_s
    end
  end

  def send_realtime_update
    RealtimeService.publish(@scheduled_message.user, "scheduled_message_sent",
      true, ScheduledMessageSerializer.serialize(@scheduled_message))
  end

  def upload_media
    if @scheduled_message.has_image?
      { media_ids: client.upload(@scheduled_message.image_stream) }
    else
      {}
    end
  end

  def client
    if @scheduled_message.user?
      TwitterService.client(@scheduled_message.user.twitter_auth_token)
    else
      TwitterService.client
    end
  end

  def fail!(reason)
    @scheduled_message.update_attributes(completed_at: Time.now, error: reason)
    raise reason unless @scheduled_message.canceled?
  end
end

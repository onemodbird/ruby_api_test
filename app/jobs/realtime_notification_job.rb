class RealtimeNotificationJob
  include Sidekiq::Worker

  def perform(notification_id)
    @notification = Notification.find(notification_id)
    send(@notification.key) if respond_to?(@notification.key, true)
    @notification.update(realtime: true)
  end

  private

  [ :collaboration_invite_accepted,
    :comment_created,
    :resource_added
  ].each do |method|

    define_method(method) do
      RealtimeService.publish(
        @notification.user,
        @notification.key,
        true,
        NotificationSerializer.serialize(@notification),
        async: false)
    end

  end
end

class EmailNotificationJob
  include Sidekiq::Worker
  sidekiq_options queue: :mailers

  def perform(notification_id)
    @notification = Notification.find(notification_id)
    send(@notification.key) if respond_to?(@notification.key, true)
    @notification.update(email: true)
  end

  private

  def mailer
    NotificationMailer
  end

  def collaboration_invite_accepted
    mailer.collaboration_invite_accepted(
      @notification.user,
      @notification.collaboration).deliver_now
  end

  def comment_created
    mailer.comment_created(
      @notification.user,
      @notification.comment).deliver_now
  end

  def resource_added
    mailer.resource_added(
      @notification.user,
      @notification.collection_resource).deliver_now
  end

end

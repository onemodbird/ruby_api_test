class NotificationMailerPreview < ActionMailer::Preview
  def collaboration_invite_accepted
    collaboration = random(:collaboration)
    NotificationMailer.collaboration_invite_accepted(collaboration.user, collaboration)
  end

  def comment_created_for_collection
    comment = random(:comment, commentable_type: "Collection")

    NotificationMailer.comment_created(random(:user), comment)
  end

  def comment_created_for_resource
    comment = random(:comment, commentable_type: "Resource")

    NotificationMailer.comment_created(random(:user), comment)
  end

  def resource_added
    NotificationMailer.resource_added(random(:user), random(:collection_resource))
  end

  private

  def random(thing, conditions = {})
    thing.to_s.camelize.constantize.where(conditions).order("RANDOM()").first
  end
end

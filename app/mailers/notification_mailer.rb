class NotificationMailer < ApplicationMailer
  add_template_helper(TextHelper)

  def collaboration_invite_accepted(user, collaboration)
    @user, @collaboration = user, collaboration

    mail to: @user.email,
      subject: "#{@collaboration.collaborator.display_name} is now collaborating on #{@collaboration.collaboratable.name} with you"
  end

  def comment_created(user, comment)
    @user, @comment = user, comment
    @commentable = @comment.commentable

    template = "comment_created_for_#{comment.commentable_type.underscore}"

    mail to: @user.email,
      subject: "#{@comment.user.name} commented on #{@commentable.name}",
      template_name: template
  end

  def resource_added(user, collection_resource)
    @user, @collection, @resource, @added_by =
      user, collection_resource.collection, collection_resource.resource, collection_resource.user

    mail to: @user.email,
      subject: "A resource was added to the '#{@collection.name}' collection"
  end
end

class CollaborationMailer < ApplicationMailer
  def invite(collaboration_id)
    @collaboration = Collaboration.find(collaboration_id)
    @link = @collaboration.link_with_token
    @message = @collaboration.message

    to = @collaboration.email || @collaboration.collaborator.email
    subject = "%s has invited you to collaborate on a %s" % [
              @collaboration.user.display_name,
              @collaboration.collaboratable_name ]

    mail to: to, subject: subject
  end
end

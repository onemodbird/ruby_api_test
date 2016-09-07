class ChatInvitationMailer < ApplicationMailer
  def invite(invitation_id)
    @invitation = ChatInvitation.find(invitation_id)

    subject = "%s has invited you to join the %s chat" % [
      @invitation.user.display_name,
      @invitation.chat.name ]

    mail to: @invitation.email, subject: subject
  end
end

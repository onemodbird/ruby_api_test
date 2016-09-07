class ChatInvitationMailerPreview < ActionMailer::Preview
  def invite
    ChatInvitationMailer.invite(ChatInvitation.first.id)
  end
end

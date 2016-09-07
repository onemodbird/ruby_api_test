class CollaborationMailerPreview < ActionMailer::Preview
  def invite
    CollaborationMailer.invite(Collaboration.first.id)
  end
end

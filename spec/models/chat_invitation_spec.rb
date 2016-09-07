require "rails_helper"

describe ChatInvitation do
  let!(:chat_invitation) { create :chat_invitation }

  it "creates an invitation with a token" do
    expect(chat_invitation.token).to_not be_nil
  end

  it "sends an email for an invitation" do
    expect(mail_body).to match "Join #{chat_invitation.chat.name}"
  end

  it "doesn't allow a duplicate within 5 minutes" do
    Timecop.freeze(chat_invitation.created_at + 4.minutes)

    expect {
      create :chat_invitation, chat: chat_invitation.chat, email: chat_invitation.email
    }.to raise_error(ActiveRecord::RecordInvalid)
  end

  it "allows a duplicate after 5 minutes" do
    Timecop.freeze(chat_invitation.created_at + 5.minutes)

    expect {
      bloop = create :chat_invitation, chat: chat_invitation.chat, email: chat_invitation.email
      }.not_to raise_error
  end
end

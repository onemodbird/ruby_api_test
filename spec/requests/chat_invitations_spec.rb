require "rails_helper"

describe Appo::Api::ChatInvitations do
  let(:user) { create :user }
  let(:chat) { create :chat }
  let(:chat_invitation) { create :chat_invitation, chat: chat }

  it "doesn't allow unauthenticated users access to invites" do
    post "/v1/chat_invitations", chat_id: chat.id, emails: "bloop@borg.org"
    expect_response_code_of(403)
  end

  it "invites an email" do
    expect {
      api_post "/v1/chat_invitations", user, chat_id: chat.id, emails: "bloop@borg.org"
    }.to change(ChatInvitation, :count).from(0).to(1)

    expect_response_code_of(201)
  end

  it "invites a list of emails" do
    expect {
      api_post "/v1/chat_invitations", user, chat_id: chat.id, emails: ["bloop@borg.org", "dude@dude.net"]
    }.to change(ChatInvitation, :count).from(0).to(2)

    expect_response_code_of(201)
  end

  it "reports a duplicate as invalid" do
    api_post "/v1/chat_invitations", user, chat_id: chat.id, emails: chat_invitation.email

    expect_response_code_of(201)
    expect(json_response).to eq({"valid"=>[], "invalid"=>[chat_invitation.email]})
  end

  it "marks an invitation accepted" do
    api_post "/v1/chat_invitations/accept", user, token: chat_invitation.token

    chat_invitation.reload
    expect(chat_invitation.accepted_at).to_not be_nil
    expect(chat_invitation.acceptor_id).to eq user.id
  end

  it "marks an invitation accepted" do
    api_post "/v1/chat_invitations/accept", user, token: chat_invitation.token

    chat_invitation.reload
    expect(chat_invitation.accepted_at).to_not be_nil
    expect(chat_invitation.acceptor_id).to eq user.id
  end

  it "sends an invite accepted notification" do
    expect {
      api_post "/v1/chat_invitations/accept", user, token: chat_invitation.token
    }.to change(Notification, :count).from(0).to(1)

    notification = Notification.first
    expect(notification.key).to eq "chat_invitation_accepted"
    expect(notification.user).to eq chat_invitation.user
    expect(notification.params).to eq({ "acceptor_id" => user.id, "chat_id" => chat.id })
  end
end

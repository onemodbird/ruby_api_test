require "rails_helper"

describe Appo::Api::Collections do

  let(:user) { create :user, :registered }
  let(:user2) { create :user, :facebook }
  let(:email) { "abcd@abcd.com" }
  let(:collection) { create(:collection, :with_resources, user: user) }
  let(:collaboration) { Collaboration.invite!(collection, emails: email)[0] }

  it "invites a collaborator by email" do
    api_post "/v1/collaborations", user,
      collection_id: collection.id, email: email

    expect_response_code_of 201

    coll = Collaboration.first
    expect(coll).to be_present
    expect(coll.email).to eq email
    expect(coll.user).to eq user
    expect(coll.collaborator).to be_blank

    expect(mail_body).to match(/Click to accept this invitation!/)
  end

  it "invites a collaborator by user ID" do
    api_post "/v1/collaborations", user,
      collection_id: collection.id, collaborator_id: user2.id

    expect_response_code_of 201

    coll = Collaboration.first
    expect(coll.user).to eq(user)
    expect(coll.collaborator).to eq(user2)

    expect(mail_body).to match(/Click to accept this invitation!/)
  end

  it "invites collaborators in bulk" do
    mailbox.clear
    api_post "/v1/collaborations", user,
      collection_id: collection.id,
      bulk: { collaborator_ids: [user2.id], emails: [email] }

    expect_response_code_of 201
    expect(Collaboration.where(email: email).exists?).to eq(true)
    expect(Collaboration.where(collaborator_id: user2.id).exists?).to eq(true)
    mailbox.last(2).each do |mail|
      expect(mail_body(mail)).to match(/Click to accept this invitation!/)
    end
  end

  it "includes a default message" do
    api_post "/v1/collaborations", user,
      collection_id: collection.id, email: "abcd@abcd.com"

    expect(mail_body).to match(/work together on a collection/)
  end

  it "includes a personal message" do
    api_post "/v1/collaborations", user,
      collection_id: collection.id, email: "abcd@abcd.com", message: "Hi it's StEvE!"

    expect(mail_body).to match(/Hi it's StEvE!/)
  end

  it "confirms a collaborator" do
    api_post "/v1/collaborations/confirm", user2, token: collaboration.token

    expect_response_code_of 201

    coll = Collaboration.first
    expect(coll.collaborator).to eq user2
  end

  it "notifies the inviter" do
    expect_realtime :collaboration_invite_accepted, to: user

    api_post "/v1/collaborations/confirm", user2, token: collaboration.token

    expect(mailbox.last.to).to eq [collaboration.user.email]
    expect(mail_body).to match(/has accepted your invitation/)
  end

  it "notifies when a token is invalid" do
    api_post "/v1/collaborations/confirm", user2, token: "xyz"

    expect(response.body).to match(/not found/i)
  end

  it "succeeds on successive attempts" do
    token = collaboration.token

    expect(collaboration.confirm(user2, token)).to eq true
    api_post "/v1/collaborations/confirm", user2, token: token

    expect_response_code_of 201
    expect(collection.reload.collaborators).to include user2
  end

  it "removes a collaborator" do
    api_delete "/v1/collaborations/#{collaboration.id}", user

    expect_response_code_of 200
    expect(Collaboration.count).to eq 0
  end
end

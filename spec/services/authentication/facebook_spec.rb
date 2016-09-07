require "rails_helper"

describe Authentication::Facebook do
  subject { Authentication::Authenticator }

  let(:profile) do
    { id: "12345678",
      name: "Barry Zuckercorn",
      email: "dude@dude.com",
      picture: { data: { url: "https://example.com/image.jpg" }}}
  end

  before(:each) do
    stub_request(:get, /https:\/\/graph.facebook.com\/me\.*/).to_return(body: profile.to_json)
  end

  describe "#new_user" do
    it "creates a new user account when provided with an unused id" do
      user = subject.register(:facebook, "provider_token")
      expect(user).to be_valid

      user = User.first
      expect(user.facebook_id).to eq "12345678"
      expect(user.email).to eq "dude@dude.com"
      expect(user.profile_photo_url).to eq("https://example.com/image.jpg")
    end

    it "finds an existing user account when provided with a used id" do
      user = create :user, :facebook, facebook_id: "12345678"

      expect(subject.register(:facebook, "provider_token")).to eq user
    end
  end

  describe "with an existing user" do
    let!(:user) { create :user, :facebook, facebook_id: profile[:id] }

    it "should allow a login with valid credentials" do
      session = subject.login(:facebook, profile[:id])
      expect(session).to be_valid
      expect(session.user).to eq user
    end
  end
end

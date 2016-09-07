require "rails_helper"

describe Authentication::Twitter do
  subject { Authentication::Authenticator }

  let(:profile) do
    { id: "12345678",
      screen_name: "bzuckcorn",
      name: "Barry Zuckercorn",
      email: "barry@zuckercorn.com",
      profile_image_url_https: "https://example.com/image_normal.png" }
  end

  before(:each) do
    stub_request(:post, /\.*api.twitter.com\/oauth2\/token/).to_return(:status => 200, :body => "", :headers => {})
    stub_request(:get, Regexp.new("https://api.twitter.com/1.1/account/verify_credentials.json.*")).to_return(body: profile.to_json)
  end

  describe "#new_user" do
    it "creates a new user account when provided with an unused id" do
      user = subject.register(:twitter, "provider_token")
      expect(user).to be_valid

      user = User.first
      expect(user.twitter_id).to eq "12345678"
      expect(user.email).to eq "barry@zuckercorn.com"
      expect(user.profile_photo_url).to eq("https://twitter.com/bzuckcorn/profile_image?size=original")
    end

    it "finds an existing user account when provided with a used id" do
      user = create :user, :twitter, twitter_id: "12345678"

      expect(subject.register(:twitter, "provider_token")).to eq user
    end
  end

  describe "with an existing user" do
    let!(:user) { create :user, :twitter, twitter_id: profile[:id] }

    it "should allow a login with valid credentials" do
      session = subject.login(:twitter, profile[:id])
      expect(session).to be_valid
      expect(session.user).to eq user
    end
  end
end

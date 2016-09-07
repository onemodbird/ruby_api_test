require "rails_helper"

describe Authentication::Google do
  subject { Authentication::Authenticator }

  let(:profile) do
    { id: "12345678",
      displayName: "Barry Zuckercorn",
      emails: [{ value: "dude@dude.com" }],
      image: { url: "https://example.com/image.jpg?sz=50", isDefault: false }}
  end

  before(:each) do
    stub_request(:get, "https://www.googleapis.com/plus/v1/people/me").to_return(body: profile.to_json)
  end

  describe "#new_user" do
    it "creates a new user account when provided with an unused id" do
      user = subject.register(:google, "provider_token")
      expect(user).to be_valid

      user = User.first
      expect(user.google_id).to eq "12345678"
      expect(user.email).to eq "dude@dude.com"
      expect(user.profile_photo_url).to eq("https://example.com/image.jpg?sz=200")
    end

    it "finds an existing user account when provided with a used id" do
      user = create :user, :google, google_id: "12345678"

      expect(subject.register(:google, "provider_token")).to eq user
    end
  end

  describe "with an existing user" do
    let!(:user) { create :user, :google, google_id: profile[:id] }

    it "should allow a login with valid credentials" do
      session = subject.login(:google, profile[:id])
      expect(session).to be_valid
      expect(session.user).to eq user
    end
  end
end

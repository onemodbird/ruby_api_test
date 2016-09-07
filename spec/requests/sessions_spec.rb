require 'rails_helper'

describe Appo::Api::Sessions do
  let(:profile_photo_url) { "http://example.com/image.jpg" }
  let(:user) { create :user, :registered, profile_photo_url: profile_photo_url }
  let(:email_token) { [user.email, user.password].join(":") }
  context "with a school" do
    let(:school) { create :school }

    it "sends organization back with log in" do
      school.add_user(user)
      api_post "/v1/sessions/login", user, {provider_token: email_token, provider: "email" }
      expect_response_code_of 201
      expect(json_response["organization_users"][0]["user_id"]).to eq user.id
    end
  end
  it "creates a user and emails a confirmation" do
    api_post "/v1/sessions", nil, { provider_token: email_token, provider: "email" }

    expect(User.count).to eq 1
    expect(mailbox.count).to eq 1
    expect(mailbox.first.subject).to match /Welcome/
  end

  it "logs in with email" do
    api_post "/v1/sessions/login", user, { provider_token: email_token, provider: "email" }

    expect_response_code_of 201
    expect(json_response["name"]).to eq user.name
    expect(json_response["profile_photo_url"]).to eq profile_photo_url
  end

  it "fails with invalid credentials" do
    api_post "/v1/sessions/login", nil, { provider_token: "#{user.email}:notthepassword", provider: "email" }
    expect(json_response["error"]).to match(/Invalid/)
    expect_response_code_of 403
  end

  describe "Provider logins" do
    let(:provider_id) { "123456789"}

    def user!(provider)
      mock_auth(provider.capitalize, provider_id: provider_id)
      create :user, "#{provider.downcase}_id": provider_id
    end

    it "logs in with facebook" do
      user!("Facebook")
      api_post "/v1/sessions/login", nil, { provider_token: provider_id, provider: "facebook" }

      expect_response_code_of 201
    end

    it "logs in with twitter" do
      user!("Twitter")
      api_post "/v1/sessions/login", nil, { provider_token: provider_id, provider: "twitter" }

      expect_response_code_of 201
    end

    it "logs in with google" do
      user!("Google")
      api_post "/v1/sessions/login", nil, { provider_token: provider_id, provider: "google" }

      expect_response_code_of 201
    end
  end

  context "with analytics" do
    it "sends analytics for a user" do
      api_post "/v1/sessions/login", nil, { provider_token: email_token, provider: "email" }
      expect_identify user_id: user.id, traits: { email: user.email }
    end

    it "reports a legacy learning center user" do
      user.update_attribute(:viflearn_user_id, "1234")
      api_post "/v1/sessions/login", nil, { provider_token: email_token, provider: "email" }
      expect_identify user_id: user.id, traits: { lc_legacy: true }
    end

    it "reports that a user is not a legacy learning center user" do
      api_post "/v1/sessions/login", nil, { provider_token: email_token, provider: "email" }
      expect_identify user_id: user.id, traits: { lc_legacy: false }
    end

    it "reports that a user is a 'cet' teacher" do
      user.update_attribute(:flags, { cet: true} )
      api_post "/v1/sessions/login", nil, { provider_token: email_token, provider: "email" }
      expect_identify user_id: user.id, traits: { cet: true }
    end
  end
end

require "rails_helper"

describe Authentication::Authenticator do
  subject { Authentication::Authenticator }

  let(:email) { "dude@dude.com" }
  let(:auth_tokens) { ["cool_token_bro", "better_token_bro"] }

  describe "with existing email" do
    let!(:user) { create :user, :registered, email: email, auth_tokens: auth_tokens }

    it "attaches a google account to an existing user" do
      mock_auth("Google", email: email)

      subject.register(:google, "provider_token")
      expect(user.reload.google_id).to_not be_nil
    end

    it "attaches a facebook account to an existing user" do
      mock_auth("Facebook", email: email)

      subject.register(:facebook, "provider_token")
      expect(user.reload.facebook_id).to_not be_nil
    end

    it "rotates through 2 auth tokens" do
      previous_tokens = auth_tokens
      subject.login(:email, "#{user.email}:password")

      user.reload

      expect(user.auth_tokens.length).to eq 2
      expect(previous_tokens & user.auth_tokens).to eq [user.auth_tokens.last]
    end

    it "rotates through 5 auth tokens for internal accounts" do
      user.update(email: Secrets.brand.internal_emails.first)

      previous_tokens = auth_tokens
      4.times { |i| subject.login(:email, "#{user.email}:password") }

      user.reload

      expect(user.auth_tokens.length).to eq 5
      expect(previous_tokens & user.auth_tokens).to eq [user.auth_tokens.last]
    end

  end

  describe "with an existing user" do
    let!(:user) { create :user, :facebook }

    it "should retreive the existing user" do
      mock_auth("Facebook", provider_id: user.facebook_id)

      expect(subject.register(:facebook, user.facebook_id)).to eq user
    end
  end

  describe "with twitter user" do
    let!(:user) { create :user, :twitter, email: nil }
    before do
      mock_auth("Twitter", email: "testing@test.com", provider_id: user.twitter_id)
    end

    it "should capture an email" do
      subject.login(:twitter, "providertoken")
      expect(user.reload.email).to be_present
    end

    it "shouldn't fail on a duplicate email" do
      create :user, email: "testing@test.com"

      expect { subject.login(:twitter, "providertoken") }.to_not raise_error
      expect(user.reload.email).to be_nil
    end
  end

end

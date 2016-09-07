require "rails_helper"

describe Authentication::Email do
  subject { Authentication::Authenticator }

  describe "#new_users" do
    it "should create a new user account when provided with email and password" do
      user = subject.register(:email, "newguy@email.com:passw0rd")
      expect(user).to be_valid

      user = User.first
      expect(user.email).to eq "newguy@email.com"
      expect(user).to_not be_confirmed
    end

    it "should notify a user of existing email" do
      create :user, :registered, email: "newguy@email.com"

      expect { subject.register(:email, "newguy@email.com:passw0rd") }.to raise_error(
        Authentication::AuthError, "Email has already been taken")
    end

    it "should not create a new user account when provided with email and no password" do
      expect { subject.register(:email, "newguy@email.com:") }.to raise_error(
        Authentication::AuthError, "Password can't be blank")

      expect(User.count).to eq 0
    end

    it "should send a confirmation email request after signing up with email and password" do
      subject.register(:email, "newguy@email.com:passw0rd")

      expect(mailbox.size).to eq 1
      expect(mail_body).to match(/confirm/)
    end

    describe "with an existing user" do
      let!(:user) { create :user, :registered }

      it "should allow a login with valid email & password" do
        session = subject.login(:email, "#{user.email}:#{user.password}")
        expect(session).to be_valid
        expect(session.user).to eq user
      end

      it "should not allow a login with invalid password" do
        expect { subject.login(:email, "#{user.email}:nowayj0se") }.to raise_error(
          Authentication::AuthError, "Invalid email or password. Please try again.")
      end
    end

  end
end

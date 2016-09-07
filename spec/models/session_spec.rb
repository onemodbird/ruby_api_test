require "rails_helper"

describe Session do

  describe "social" do

    describe "existing users" do
      let(:auth_tokens) { ["cool_token_bro", "better_token_bro"] }
      let(:user) { create :user, :registered, auth_tokens: auth_tokens }

      it "logs in with a token and doesn't update the token" do
        expect { Session.new(user.auth_token) }.to_not change { user.auth_tokens }
      end

      it "allows a user multiple auth tokens" do
        user.auth_tokens.each do |auth_token|
          session = Session.new(auth_token)

          expect(session).to be_valid
          expect(session.user).to eq user
        end
      end

      it "fails authentication for an older auth_token" do
        token = user.auth_token

        user.token_history.times { user.update_auth_token! }

        session = Session.new(token)
        expect(session).to_not be_valid
      end

      it "should unconfirm a user if they change their email address" do
        user.confirm
        expect(user).to be_confirmed
        ActionMailer::Base.deliveries.clear

        user.email = "dude2@dude.com"
        user.save
        expect(user).to_not be_confirmed

        expect(mailbox.size).to eq 1
        expect(mail_body).to match(/confirm/)
      end
    end

  end

end

require "rails_helper"

describe Appo::Api::Feedback do
  let(:user) { create :user }
  let(:content) { "Good work team!" }
  
  describe "POST /v1/feedback" do
    it "sends an unauthenticated feedback email" do
      post "/v1/feedback", { code: :feedback_key, content: content, email: "email@email.com"}

      expect(mailbox.last.to).to eq [Secrets.brand.feedback_address]
      expect(mailbox.last.subject).to eq "Feedback received: feedback_key"
      expect(mail_body).to match /User: not logged in/
      expect(mail_body).to match /#{content}/
    end

    it "sends an authenticated feedback email" do
      api_post "/v1/feedback", user, { code: :feedback_key, content: content, email: user.email }

      expect(mailbox.last.to).to eq [Secrets.brand.feedback_address]
      expect(mail_body).to match /#{user.name}/
    end
  end
end

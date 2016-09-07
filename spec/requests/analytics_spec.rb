require "rails_helper"

describe Appo::Api::Analytics do
  let(:user) { create :user, :registered }
  let(:anonymous_id) { SecureRandom.uuid }

  describe "POST /v1/analytics" do
    it "tracks event for logged in user" do
      data = { "im" => "about to" }
      api_post "/v1/analytics", user, { event: :track_it_up_kris, data: data }

      expect_response_code_of(201)
      expect_tracking :track_it_up_kris, user_id: user.id, data: data
    end

    it "tracks event for an anonymous user" do
      post "/v1/analytics", anonymous_id: anonymous_id, event: "anonymous"
      expect_response_code_of(201)
    end

    it "errors if event name not provided" do
      api_post "/v1/analytics", user, { event: "" }

      expect_response_code_of(400)
      expect(json_response["error_message"]).to eq "Event is empty"
    end

    it "errors if neither user nor anonymous_id are provided" do
      post "/v1/analytics", event: "event"
      expect_response_code_of(400)
    end

    it "errors if ONLY auth_token is supplied but doesn't identify a user" do
      post "/v1/analytics", auth_token: SecureRandom.uuid, event: "event"
      expect_response_code_of(403)
    end

  end
end

require "rails_helper"

describe Appo::Api::BadgeAssertions do

  it "requires a user ID" do
    get "/v1/badge_assertions"
    expect_response_code_of(400)
  end

  context "with a user" do
    let(:user) { create :user }
    let!(:badge_assertion) { create :badge_assertion, user: user }
    let!(:other_assertion) { create :badge_assertion }

    it "returns earned badges for a user" do
      get "/v1/badge_assertions", user_id: user.id

      assertions = json_response["badge_assertions"]
      expect(assertions.size).to eq(1)
      expect(assertions[0]["id"]).to eq(badge_assertion.id)
    end
  end
end

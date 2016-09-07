require "rails_helper"

describe Appo::Api::Badge do
  let(:badge) { create :badge }
  let(:badge_requirement) { create :badge_requirement, badge: badge }
  let(:user) { create :user }
  let(:artifact) { create :resource, kind: "learning_product" }

  it "responds with badge info" do
    get "/v1/badges/#{badge.id}"

    expect(json_response["id"]).to eq badge.id
    expect(json_response["name"]).to eq badge.name
    expect(json_response["badge_assertion"]).to be_blank
  end

  it "responds with badge assertion info if user has earned it" do
    badge_requirement.earn! user, artifact
    api_get "/v1/badges/#{badge.id}", user

    assertion_resp = json_response["badge_assertion"]
    expect(assertion_resp).to be_present
    expect(assertion_resp["user_id"]).to eq user.id
    expect(assertion_resp["artifact"]).to be_present
    expect(assertion_resp["artifact"]["id"]).to eq artifact.id
  end
end

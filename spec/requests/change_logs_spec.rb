require "rails_helper"

describe Appo::Api::Comments do
  [:creator, :collaborator, :other].each do |user|
    let(user) { create :user, :registered }
  end
  let(:collection) { create :collection, user: creator }
  let(:resource) { create :resource }

  describe "GET /v1/:change_loggable_type/:change_loggable_id/change_logs" do
    before do
      collection.add_resource(creator, resource.id)
      collection.update(changed_by: creator.id, name: "New name")
    end

    it "shows all change_logs" do
      api_get "/v1/collections/#{collection.id}/change_logs", creator

      expect_response_code_of 200
      expect(json_response["change_logs"].count).to eq 2
      expect(json_response["change_logs"].first["resource"]).to be_present
      expect(json_response["change_logs"].last["change"]).to eq "name updated"
    end
  end
end

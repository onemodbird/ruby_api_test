require "rails_helper"

describe Appo::Api::CollectionResources do
  let(:user) { create :user }
  let(:collection) { create :collection, :with_resources, resources_count: 2, user: user }
  let(:resource_ids) { collection.collection_resources.map(&:resource_id) }

  it "fails on no change" do
    api_put "/v1/collections/#{collection.id}/resources/#{resource_ids[0]}", user
    expect_response_code_of 400
  end

  it "reorders a collection resource" do
    api_put "/v1/collections/#{collection.id}/resources/#{resource_ids[0]}", user, { position: 2 }
    expect(CollectionResource.where(resource_id: resource_ids[0]).first.position).to eq 2
  end
end

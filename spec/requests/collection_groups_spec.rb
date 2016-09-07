require "rails_helper"

RSpec.describe Appo::Api::CollectionGroups do

  let(:name) { Faker::Lorem.words(2).join(" ") }
  let(:user) { create :user, :registered }
  let(:collection) { create :collection }
  let(:collections) { [{ "id" => collection.id }] }
  let(:collection_group) { create :collection_group, user: user }

  describe "GET /v1/collection_groups" do
    it "returns collection groups for the current user" do
      collection_group

      api_get "/v1/collection_groups", user

      expect_response_code_of(200)
      expect(json_response.size).to eq(1)

      expect(json_response.fetch("collection_groups").first.fetch("id"))
      .to eq(collection_group.id)
    end
  end

  describe "POST /v1/collection_groups" do
    it "adds a collection for the current user" do
      params = { name: name, collections: collections }

      expect(CollectionGroup.count).to eq(1)

      api_post "/v1/collection_groups", user, params

      expect_response_code_of(201)
      expect(CollectionGroup.count).to eq(2)
      expect(json_response.fetch("name")).to eq(name)

      expect(json_response.fetch("collections").first)
      .to include(collections.first)
    end
  end

  describe "GET /v1/collection_groups/:id" do
    it "returns a specific collection group" do
      api_get "/v1/collection_groups/#{collection_group.id}", user

      expect_response_code_of(200)
      expect(json_response.fetch("id")).to eq(collection_group.id)
    end

    it "returns 404 if not found" do
      missing_id = SecureRandom.uuid

      api_get "/v1/collection_groups/#{missing_id}", user

      expect_response_code_of(404)
    end
  end

  describe "PUT /v1/collection_groups/:id" do
    it "updates the collection group" do
      params = { name: name, collections: collections }

      expect(collection_group.name).not_to eq(name)
      expect(collection_group.collections).to eq([])

      api_put "/v1/collection_groups/#{collection_group.id}", user, params
      collection_group.reload

      expect_response_code_of(200)
      expect(collection_group.name).to eq(name)
      expect(collection_group.collections).to eq(collections)
    end
  end

  describe "DELETE /v1/collection_groups/:id" do
    it "deletes the collection group" do
      api_delete "/v1/collection_groups/#{collection_group.id}", user

      expect_response_code_of(200)
      expect(CollectionGroup.find_by_id(collection_group.id)).to eq(nil)
    end
  end

end

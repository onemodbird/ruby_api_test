require "rails_helper"

describe CollectionGroupFeaturedSerializer do

  let(:collection_group) { create :collection_group }
  let(:serializer) {
    CollectionGroupFeaturedSerializer.new(collection_group)
  }
  let(:serialized) { serializer.serializable_hash }

  it "has the right attributes" do
    expected_keys = [:id, :name, :user, :collections]
    expect(serialized.keys).to eq(expected_keys)
  end

  it "includes a user" do
    expect(serialized[:user][:name]).to eq collection_group.user.name
  end

  it "uses only featurable_collections" do
    expect(collection_group).to receive(:featureable_collections)
    serializer.collections
  end
end

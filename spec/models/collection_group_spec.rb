require 'rails_helper'

describe CollectionGroup do

  it "reindexes collections if it is the 'hidden' group" do
    cg = CollectionGroup.hidden
    c = Collection.new(user_id: cg.user_id, name: 'name')
    cg.collections = [ { id: c.id } ]

    expect(cg).to receive(:reindex_hidden_collections).and_call_original
    expect(Collection).to receive(:where).with(id: [c.id]).and_return([c])
    expect(c).to receive(:index!)

    cg.save!
  end

  it "doesn't reindex collections if not the 'hidden' group" do
    cg = CollectionGroup.featured
    c = Collection.new(user_id: cg.user_id, name: 'name')
    cg.collections = [ { id: c.id } ]

    expect(cg).not_to receive(:reindex_hidden_collections)

    cg.save!
  end

  describe "#featurable_collections" do
    it "only includes public, non-editorially hidden collections" do
      public_collection = create :collection
      hidden_collection = create :collection, visibility: "hidden"
      private_collection = create :collection, visibility: "private"
      editorially_hidden_collection = create :collection

      hidden_collection_group = CollectionGroup.hidden
      hidden_collection_group.update(
        collections: [{ id: editorially_hidden_collection.id }]
      )

      collections = [
        { id: public_collection.id },
        { id: hidden_collection.id },
        { id: private_collection.id },
        { id: editorially_hidden_collection.id }
      ]

      cg = build :collection_group, collections: collections
      expect(cg.featureable_collections).to eq([public_collection])
    end
  end
end

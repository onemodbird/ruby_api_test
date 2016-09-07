require "rails_helper"

describe Collection do

  let(:user) { create :user, :facebook }
  let(:user2) { create :user, :facebook }
  let(:collection) { create(:collection, :with_resources, user: user) }

  def coll!(resources = [], name = "new collection")
    assign_resources(create(:collection, user: user, name: name), resources)
  end

  def make_collection(method, attrs = {})
    resources = attrs.delete(:resources)

    assign_resources(
      Collection.public_send(method, { user_id: user.id, name: "name", visibility: "public" }.merge(attrs)),
      resources
    )
  end

  def make_resource(method = "create!", attrs = {})
    Resource.public_send(method, {
      user_id: user.id,
      url: "https://url/" + SecureRandom.hex,
      kind: "webpage",
      visibility: "public"
    }.merge(attrs))
  end

  describe ".index_tags" do
    it "prepends 'all' to the list" do
      expect(Collection.index_tags.first).to eq("all")
    end

    it "removes blank tags" do
      create :collection, tags: [""]
      expect(Collection.index_tags).not_to include("")
    end

    it "removes duplicates (case-insensitive)" do
      create :collection, tags: ["TAG", "ALL"]
      create :collection, tags: ["tag"]

      tags = Collection.index_tags
      expect(tags).to eq(["all", "tag"])
    end

    it "returns the number of tags specified" do
      quantity = 20
      create :collection, tags: ("a".."z").to_a
      expect(Collection.index_tags(quantity).size).to eq(quantity)
    end
  end

  describe ".mget" do
    it "returns docs in the order specified by the array if ids to get" do
      Collection.create_index!
      c1, c2 = [coll!, coll!]
      Collection.import

      mget1 = Collection.mget([c1.id, c2.id])
      expect(mget1.size).to eq(2)
      expect(mget1[0].fetch("id")).to eq(c1.id)
      expect(mget1[1].fetch("id")).to eq(c2.id)

      mget2 = Collection.mget([c2.id, c1.id])
      expect(mget2.size).to eq(2)
      expect(mget2[0].fetch("id")).to eq(c2.id)
      expect(mget2[1].fetch("id")).to eq(c1.id)
    end
  end


  describe "when a resource is added" do
    it "applies the visibility setting to the resource" do
      private_r = make_resource :create!, visibility: "private"
      c = make_collection :create!, visibility: "public"
      c.add_resource(user, private_r.id)

      expect(private_r.reload.visibility).to eq("public")
    end
  end


  describe "when a collection becomes public" do
    it "webpages become public" do
      hidden_r = make_resource :create!, visibility: "hidden"
      private_r = make_resource :create!, visibility: "private"
      c = make_collection :create!, visibility: "private", resources: [hidden_r, private_r]

      c.update_attributes visibility: "public"

      expect(hidden_r.reload.visibility).to eq("public")
      expect(private_r.reload.visibility).to eq("public")
    end

    it "files become public" do
      hidden_r = make_resource :create!, visibility: "hidden", kind: "file"
      private_r = make_resource :create!, visibility: "private", kind: "file"
      c = make_collection :create!, visibility: "private", resources: [hidden_r, private_r]

      c.update_attributes visibility: "public"

      expect(hidden_r.reload.visibility).to eq("public")
      expect(private_r.reload.visibility).to eq("public")
    end
  end

  describe "when a collection becomes hidden" do
    it "private webpages become hidden" do
      private_r = make_resource :create!, visibility: "private"
      c = make_collection :create!, visibility: "private", resources: [private_r]

      c.update_attributes visibility: "hidden"

      expect(private_r.reload.visibility).to eq("hidden")
    end

    it "public webpages become hidden if owner and no other collections" do
      r = make_resource :create!, visibility: "public"
      c = assign_resources(create(:collection, visibility: "public", user: user), [r])

      c.update_attributes visibility: "hidden"

      expect(r.reload.visibility).to eq("hidden")
    end

    it "public webpages maintain visibility if not owner" do
      r = make_resource :create!, visibility: "public", user_id: user2.id
      c = make_collection :create!, visibility: "public", resources: [r]

      c.update_attributes visibility: "hidden"

      expect(r.reload.visibility).to eq("public")
    end

    it "public webpages maintain visibility if other collections" do
      r = make_resource :create!, visibility: "public"
      c = make_collection :create!, visibility: "public", resources: [r]
      c2 = make_collection :create!, visibility: "private", resources: [r]
      c.update_attributes visibility: "hidden"

      expect(r.reload.visibility).to eq("public")
    end

    ## Files

    it "private files become hidden" do
      private_r = make_resource :create!, visibility: "private", kind: "file"
      c = make_collection :create!, visibility: "private", resources: [private_r]
      c.update_attributes visibility: "hidden"

      expect(private_r.reload.visibility).to eq("hidden")
    end

    it "public files become hidden if owner and no other collections" do
      r = make_resource :create!, visibility: "public", kind: "file"
      c = make_collection :create!, visibility: "public", resources: [r]
      c.update_attributes visibility: "hidden"

      expect(r.reload.visibility).to eq("hidden")
    end

    it "public files maintain visibility if not owner" do
      r = make_resource :create!, visibility: "public", user_id: user2.id, kind: "file"
      c = make_collection :create!, visibility: "public", resources: [r]
      c.update_attributes visibility: "hidden"

      expect(r.reload.visibility).to eq("public")
    end

    it "public files maintain visibility if other collections" do
      r = make_resource :create!, visibility: "public", kind: "file"
      c = make_collection :create!, visibility: "public", resources: [r]
      c2 = make_collection :create!, visibility: "private", resources: [r]
      c.update_attributes visibility: "hidden"

      expect(r.reload.visibility).to eq("public")
    end
  end

  describe "when a collection becomes private" do
    it "webpages become private if owner and no other collections" do
      r = make_resource :create!, visibility: "public"
      c = make_collection :create!, visibility: "public", resources: [r]
      c.update_attributes visibility: "private"

      expect(r.reload.visibility).to eq("private")
    end

    it "webpages maintain visibility if not owner" do
      r = make_resource :create!, visibility: "public", user_id: user2.id
      c = make_collection :create!, visibility: "public", resources: [r]
      c.update_attributes visibility: "private"

      expect(r.reload.visibility).to eq("public")
    end

    it "webpages maintain visibility if other collections" do
      r = make_resource :create!, visibility: "public"
      c = make_collection :create!, visibility: "public", resources: [r]
      c2 = make_collection :create!, visibility: "private", resources: [r]
      c.update_attributes visibility: "private"

      expect(r.reload.visibility).to eq("public")
    end

    # Files

    it "files become private if owner and no other collections" do
      r = make_resource :create!, visibility: "public", kind: "file"
      c = make_collection :create!, visibility: "public", resources: [r]
      c.update_attributes visibility: "private"

      expect(r.reload.visibility).to eq("private")
    end

    it "files maintain visibility if not owner" do
      r = make_resource :create!, visibility: "public", user_id: user2.id, kind: "file"
      c = make_collection :create!, visibility: "public", resources: [r]

      c.update_attributes visibility: "private"

      expect(r.reload.visibility).to eq("public")
    end

    it "files maintain visibility if other collections" do
      r = make_resource :create!, visibility: "public", kind: "file"
      c = make_collection :create!, visibility: "public", resources: [r]
      c2 = make_collection :create!, visibility: "private", resources: [r]

      c.update_attributes visibility: "private"

      expect(r.reload.visibility).to eq("public")
    end
  end

  context "subscriptions" do
    it "subscribes to a new collection" do
      collection = coll!
      expect(user.subscriptions.first.subscribable).to eq collection
    end

    it "removes subscriptions to a collection on deletion" do
      collection = coll!
      collection.destroy

      expect(Subscription.count).to eq 0
    end
  end

  it "should not allow duplicate resources" do
    collection.add_resource user, create(:resource).id
    expect(collection.collection_resources.size).to eq 6
    expect(ChangeLog.count).to eq 1

    existing_resource = collection.resources.first
    collection.add_resource user, existing_resource.id
    collection.reload
    expect(collection.collection_resources.size).to eq 6

    expect(ChangeLog.count).to eq 1
  end

  it "deletes associated collection_resources and resource added notifications" do
    another = create(:collection, user: user)
    collab!(collection, user2)

    collection.add_resource(user, create(:resource).id)
    collection.destroy

    expect(Notification.where(key: "resource_added")).to be_empty
    expect(CollectionResource.count).to eq another.collection_resources.count
  end

  it "deletes associated collaborations and invite accepted notifications" do
    collaboration = collab!(collection, user2)[0]

    collection.destroy

    expect(Notification.where(key: "collaboration_invite_accepted")).to be_empty
    expect(Collaboration.where(id: collaboration.id)).to be_empty
  end

  it "deletes associated comments and comment notifications" do
    collab!(collection, user2)
    comment = create :comment, user: user2, commentable: collection

    collection.destroy

    expect(Comment.all).to be_empty
    expect(Notification.where(key: "comment_created")).to be_empty
  end
end

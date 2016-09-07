require "rails_helper"

describe Appo::Api::Collections do

  let(:resource) { create :resource }
  let(:user) { create :user, :facebook }
  let(:other) { create :user, :facebook, email: Faker::Internet.email }
  let(:name) { "stuff" }
  let(:collection) do
    collection = create :collection, user: user, name: name
    collection.collection_resources.create(user: user, resource_id: resource.id, position: 1)
    collection
  end
  let(:collection_with_resources) { create(:collection, :with_resources, resources_count: 5, user: user, name: name) }
  let(:latest) { Collection.order(created_at: :desc).first }

  def collection_params(params = {})
    { collection: {
        resources: resource_params(params[:resource_count]),
        name: name } }.merge(params)
  end

  def resource_params(resource_count = nil)
    create_list(:resource, resource_count || 0).map do |resource|
      { id: resource.id, description: Faker::Lorem.sentence }
    end
  end

  describe "POST /v1/collections" do
    it "creates an empty collection" do
      api_post "/v1/collections", user, collection_params
      expect_response_code_of 201

      expect(latest.user_id).to eq user.id
      expect(latest.name).to eq name
      expect_prerender_record(latest)
    end

    it "creates a collection with resources" do
      api_post "/v1/collections", user, params = collection_params(resource_count: 2)
      expect_response_code_of 201

      expect(latest.resources.size).to eq 2
      expect(latest.collection_resources.map(&:user_id).uniq).to eq [user.id]
      expect(latest.resources.map(&:id)) =~ params[:collection][:resources].map{|r| r[:id]}
    end

    it "won't create collections without a user" do
      api_post "/v1/collections", "xyz", collection_params

      expect(Collection.count).to eq 0
    end
  end

  describe "PUT /v1/collections" do
    it "lets users update their collections" do
      api_put "/v1/collections/#{collection.id}", user, { collection: { name: "new stuff" } }

      expect_response_code_of 200
      expect(latest.name).to eq "new stuff"
      expect_prerender_record(latest)
    end

    it "doesn't let users update other collections" do
      api_put "/v1/collections/#{collection.id}", other, { collection: { name: "new stuff" } }

      expect_response_code_of 403

      expect(json_response["error"]).to eq "Unauthorized"
      expect(latest.name).to eq "stuff"
    end
  end

  describe "DELETE /v1/collections/:id" do
    it "doesn't let users delete other collections" do
      api_delete "/v1/collections/#{collection.id}", other

      expect_response_code_of 403
      expect(json_response["error"]).to eq "Unauthorized"
    end
  end

  describe "POST collections/:collection_id/resources" do
    it "adds a resource" do
      api_post "/v1/collections/#{collection.id}/resources", user, id: resource.id

      expect_response_code_of 201
      expect(json_response).to eq({ "id" => resource.id })
      expect_prerender_record(latest)
    end

    it "notifies users when a resource is added" do
      users = create_list(:user, 2, :registered)
      collab!(collection, users)

      expect_realtime :resource_added,
        to: collection.subscribers,
        excluding: users[0]

      api_post "/v1/collections/#{collection.id}/resources", users[0], id: create(:resource).id

      expect_notification(/resource was added/, [user, users[1]])
    end

    it "removes a resource and reorders" do
      FactoryGirl.reload # Occasionally, the sequence isn't resetting

      delete_id = collection_with_resources.collection_resources.find_by(position: 3).resource_id
      api_delete "/v1/collections/#{collection_with_resources.id}/resources/#{delete_id}", user

      expect_response_code_of 200
      expect(json_response["deleted"]).to eq delete_id
      expect(collection_with_resources.reload.resources).not_to include delete_id
      expect(collection_with_resources.collection_resources.map(&:position)).to eq [1,2,3,4]
      expect_prerender_record(latest)
    end

    it "updates a description" do
      api_put "/v1/collections/#{collection.id}/resources/#{resource.id}", user, { description: "new" }

      expect_response_code_of 200
      expect(json_response) =~ ({ id: resource.id, description: "new" })
      expect(collection.reload.collection_resources.first["description"]).to eq "new"
      expect_prerender_record(latest)
    end

    it "reorders a resource" do
      collection = collection_with_resources
      resource_id = collection.collection_resources[2].resource.id

      api_put "/v1/collections/#{collection.id}/resources/#{resource_id}", user, { position: 1 }

      expect_response_code_of 200
      expect(json_response).to eq ({ "id" => resource_id, "position" => 1 })

      # Should change from: 1 2 3 4 5 => 3 1 2 4 5
      new_ids = collection.collection_resources.order(:position).map{|r| r.resource.id}
      expect(new_ids).to eq [3, 1, 2, 4, 5].map{ |i| collection.collection_resources[i - 1].resource.id }
    end
  end

  describe "change logging" do
    it "adds a log for a adding resource" do
      api_post "/v1/collections/#{collection.id}/resources", user, params = resource_params(1).first

      collection.reload
      expect(collection.change_logs.count).to eq 1
      expect(collection.change_logs.last.change).to eq "resource added"
      expect(collection.change_logs.last.associated_id).to eq params[:id]
    end

    it "adds a log for removing a resource" do
      api_delete "/v1/collections/#{collection.id}/resources/#{resource.id}", user

      expect_response_code_of 200
      expect(json_response["deleted"]).to eq resource.id
    end

    it "creates a log for a reorder" do
      collection = create :collection, :with_resources, user: user
      collection.reload

      api_put "/v1/collections/#{collection.id}/resources/#{collection.resources.first.id}", user, { position: 3 }
      expect(collection.change_logs.last.change).to eq "resources reordered"
      expect(collection.change_logs.last.associated).to be_nil
    end
  end

  describe "GET /v1/collections/:id" do
    it "finds the collection, given a valid id" do
      collection = create :collection, user: user

      get "/v1/collections/#{collection.id}"
      expect_response_code_of 200
    end

    it "shows a collection as not subscribed by default" do
      collection = create :collection, user: user

      get "/v1/collections/#{collection.id}"
      expect(json_response["subscribed"]).to eq false
    end

    it "shows a collection as subscribed for the creating user" do
      collection = create :collection, user: user

      api_get "/v1/collections/#{collection.id}", user
      expect(json_response["subscribed"]).to eq true
    end

    it "includes a transcript if it exists" do
      transcript = create :transcript
      collection = transcript.generate_collection

      api_get "/v1/collections/#{collection.id}", user
      expect(json_response["transcript"]["id"]).to eq transcript.id
    end

    it "finds hidden collections" do
      collection = create :collection, user: user, visibility: "hidden"

      get "/v1/collections/#{collection.id}"
      expect_response_code_of 200
    end

    it "404s when the collection is not found" do
      get "/v1/collections/987654321"
      expect_response_code_of 404
    end

    it "paginates resources" do
      collection = collection_with_resources
      collection.collection_resources[2].update_attribute :description, "this is a collection desc"

      get "/v1/collections/#{collection.id}/resources?page=2&per=2"
      expect_response_code_of 200
      expect(json_response.size).to eq 2
      expect(json_response[0]["id"]).to eq collection.resources[2].id
      expect(json_response[0]["collection_description"]).to eq "this is a collection desc"
    end

    it "delivers resources after a specific index" do
      collection = collection_with_resources

      get "/v1/collections/#{collection.id}/resources?after_resource=3"
      expect_response_code_of 200
      expect(json_response.size).to eq 2
      expect(json_response[0]["id"]).to eq collection.resources[3].id
      expect(json_response[1]["id"]).to eq collection.resources[4].id
    end

    context "with a private collection" do
      let(:collection) { create :collection, user: user, visibility: "private" }

      it "403s for private collections when requestor not the owner" do

        get "/v1/collections/#{collection.id}"
        expect_response_code_of 403

        api_get "/v1/collections/#{collection.id}", other
        expect_response_code_of 403
      end

      it "allows a user access with a collaboration_token" do
        collaboration = collab!(collection, other)[0]

        get "/v1/collections/#{collection.id}?collaboration_token=#{collaboration.token}"
        expect_response_code_of 200
      end

      it "makes private collections accessible to the owner" do
        api_get "/v1/collections/#{collection.id}", user
        expect_response_code_of 200
      end

    end

    it "includes collaborating users" do
      collaboration = create :collaboration, :active, user: user, collaborator: other
      collection = collaboration.collaboratable
      collaborator_keys = %w(id name profile_photo_url expert subscribed)

      get "/v1/collections/#{collection.id}"
      expect_response_code_of 200

      collaborators = json_response.fetch('collaborators')

      expect(collaborators.size).to eq(1)
      expect(collaborators.first.keys).to eq(collaborator_keys)
      expect(collaborators.first.fetch('id')).to eq(other.id)
    end

    it "shows editable resources" do
      coll = collection_with_resources
      Resource.update_all user_id: coll.user_id
      coll.resources.reload
      expect(coll.resources.count).to eq 5
      expect(coll.resources[0].user_id).to eq coll.user_id

      get "/v1/collections/#{coll.id}?auth_token=#{coll.user.auth_token}"
      resources = json_response.fetch("resources")
      expect(resources[0]["permissions"]).to eq(["edit"])
    end
  end

  describe "GET /v1/collections" do
    before { Collection.create_index! }

    def use(*args)
      # the arguments to use should be defined in let blocks which will
      # create the collections, then we import and refresh to make sure all
      # are available to search
      Collection.import
      Collection.refresh_index!
    end

    let(:collection1) do
      Collection.create!(
        user_id: user.id,
        name: "collection1",
        tags: %w(tag1)
      )
    end

    let(:collection2) do
      Collection.create!(
        user_id: user.id,
        name: "collection2",
        tags: %w(tag2)
      )
    end

    let(:collection_hidden) do
      Collection.create!(
        user_id: user.id,
        name: "collection_hidden",
        visibility: "hidden"
      )
    end

    it "finds collections" do
      use collection1

      get "/v1/collections"

      expect(json_response["page"]["total"]).to eq(1)
      expect(json_response["results"].size).to eq(1)
    end

    it "allows results per page to be specified" do
      use collection1, collection2

      get "/v1/collections", per: 1

      expect(json_response["page"]["total"]).to eq(2)
      expect(json_response["results"].size).to eq(1)
    end

    it "orders by updated timestamp when not searching (no q param)" do
      collection1.update_attribute :updated_at, 1.day.ago
      collection2.update_attribute :updated_at, 1.hour.ago
      use collection1, collection2

      get "/v1/collections"

      expect(json_response["results"].map{ |res| res["id"] }).to eq [collection2.id, collection1.id]
    end

    it "excludes editorially hidden collections" do
      CollectionGroup.hidden.update_attributes! collections: [{ id: collection1.id }]
      use collection1

      get "/v1/collections"

      expect(json_response["results"]).to be_empty
    end

    it "excludes system generated collections" do
      collection1.update_attribute(:user_id, Appo::Constants::NIL_UUID)
      use collection1, collection2

      get "/v1/collections"

      expect(json_response["page"]["total"]).to eq 1
      expect(json_response["results"].first["id"]).to eq collection2.id
    end

    it "excludes non-public (hidden, private) collections" do
      collection1.update_attribute(:visibility, "private")
      collection2.update_attribute(:visibility, "hidden")
      use collection1, collection2

      get "/v1/collections"

      expect(json_response["page"]["total"]).to eq 0
      expect(json_response["results"]).to be_empty
    end

    it "filters collections by tag" do
      use collection1, collection2

      get "/v1/collections?tag=tag2"

      expect(json_response["page"]["total"]).to eq 1
      expect(json_response["results"].first["id"]).to eq collection2.id
    end

    it "treats multi-word tags as a single token when filtering" do
      collection.update_attributes(tags: ["a multiword tag"])
      use collection

      get "/v1/collections?tag=tag"

      expect(json_response["page"]["total"]).to eq(0)
      expect(json_response["results"].size).to eq(0)
    end

    it "searches by name" do
      use collection1, collection2

      get "/v1/collections?q=collection1"

      expect(json_response["page"]["total"]).to eq 1
      expect(json_response["results"].first["id"]).to eq collection1.id
    end

    it "searches by tag" do
      use collection1, collection2

      get "/v1/collections?q=tag1"

      expect(json_response["page"]["total"]).to eq 1
      expect(json_response["results"].first["id"]).to eq collection1.id
    end

    it "shows all user collections to an authorized viewer" do
      use collection1, collection_hidden
      api_get "/v1/collections?user_id=#{user.id}", user

      results = json_response["results"]
      expect(results.length).to eq 2
      expect(results[0]["id"]).to eq collection_hidden.id
      expect(results[1]["id"]).to eq collection1.id
    end

    it "shows the same user collections as the dashboard" do
      10.times do |i|
        create :collection,
          visibility: i < 3 ? "hidden" : "public",
          created_at: Time.now - rand(10).months - 10.months,
          updated_at: Time.now - rand(10).months,
          user: user
      end
      api_get "/v1/collections?user_id=#{user.id}", user
      collection_results = JSON.parse(response.body)["results"][0..5]

      api_get "/v1/dashboard", user
      dashboard_results = JSON.parse(response.body)["recent_collections"][0..5]

      expect(collection_results.map{ |c| c["id"] }).to eq dashboard_results.map{ |c| c["id"] }
    end

    it "shows only public user collections to an unauthorized viewer" do
      use collection1, collection_hidden
      get "/v1/collections?user_id=#{user.id}"

      results = json_response["results"]
      expect(results.length).to eq 1
      expect(results[0]["id"]).to eq collection1.id
    end

    it "searches collection description" do
      collection.update_attributes(description: "description1")
      use collection

      get "/v1/collections?q=description1"

      expect(json_response["results"].first["id"]).to eq collection.id
    end

    it "searches resource names" do
      resource.update_attributes(name: "resourcename")
      use collection

      get "/v1/collections?q=resourcename"

      expect(json_response["results"].first["id"]).to eq collection.id
    end

    it "searches resource tags" do
      resource.update_attributes(tags: %w(resourcetag))
      use collection

      get "/v1/collections?q=resourcetag"

      expect(json_response["results"].first["id"]).to eq collection.id
    end

    it "does not treat multi-word tags as a single token when searching" do
      collection.update_attributes(tags: ["tag with multiple words"])
      use collection

      get "/v1/collections?q=MULTIPLE"

      expect(json_response["results"].first["id"]).to eq collection.id
    end

    it "is indifferent about pluralization" do
      collection.update_attributes(name: "LEGOs")
      use collection

      get "/v1/collections?q=lego"

      expect(json_response["results"].first["id"]).to eq collection.id
    end
  end
end

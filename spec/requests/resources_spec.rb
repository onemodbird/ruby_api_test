require "rails_helper"

describe Appo::Api::Resources do

  describe "Resource Creation" do

    let(:user) { create :user, :google }
    let(:other_user) { create :user }
    let(:url) { "https://example.com/bogus" }
    let(:fetched_data) do
      { name: "name",
        price: "price",
        owner: "owner",
        image_url: "image_url" }
    end
    let(:app_fetcher) do
      instance_double "Appo::Fetchers::App", resource_data: fetched_data
    end
    let(:video_fetcher) do
      instance_double "Appo::Fetchers::Video", resource_data: fetched_data
    end
    let(:webpage_fetcher) do
      instance_double "Appo::Fetchers::Webpage", resource_data: fetched_data
    end
    let(:ibook_fetcher) do
      instance_double "Appo::Fetchers::Ibook", resource_data: fetched_data
    end
    let(:resource) { create :resource }
    let(:resource_with_user) { create :resource, user: user }
    let(:resource_with_user_hidden) { create :resource, user: user, visibility: "hidden" }
    let(:latest) { Resource.order(created_at: :desc).first }
    let(:uploaded_file) { create :uploaded_file }
    let(:file) { Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/pixel.png")) }

    before(:each) do
      allow(Appo::Fetchers::App).to receive(:new).and_return(app_fetcher)
      allow(Appo::Fetchers::Video).to receive(:new).and_return(video_fetcher)
      allow(Appo::Fetchers::Webpage).to receive(:new).and_return(webpage_fetcher)
      allow(Appo::Fetchers::Ibook).to receive(:new).and_return(ibook_fetcher)
    end

    describe "#index" do

      it "lists all user resources to an authorized viewer" do
        resource_with_user && resource_with_user_hidden
        api_get "/v1/resources?user_id=#{user.id}", user

        expect_response_code_of 200
        results = json_response["results"]
        expect(results.length).to eq 2
        expect(results[0]["id"]).to eq resource_with_user_hidden.id
        expect(results[1]["id"]).to eq resource_with_user.id
      end

      it "lists only public resources to an unauthorized user" do
        resource_with_user && resource_with_user_hidden
        get "/v1/resources?user_id=#{user.id}"

        expect_response_code_of 200
        results = json_response["results"]
        expect(results.length).to eq 1
        expect(results[0]["id"]).to eq resource_with_user.id
      end

    end

    describe "#show" do
      it "finds public resources" do
        get "/v1/resources/#{resource.id}"

        expect_response_code_of 200
        expect(json_response["type"]).to eq "webpage"
      end

      it "finds hidden resources" do
        resource = create :resource, visibility: "hidden"
        get "/v1/resources/#{resource.id}"
        expect_response_code_of 200
      end

      it "appears editable to creator" do
        resource = create :resource, user_id: user.id
        api_get "/v1/resources/#{resource.id}", user

        expect_response_code_of 200
        expect(json_response["editable"]).to eq true
      end

      it "appears non-editable to non-creator" do
        resource = create :resource, user_id: "1234"
        api_get "/v1/resources/#{resource.id}", user

        expect_response_code_of 200
        expect(json_response["editable"]).to eq false
      end

      it "404s when the resource is not found" do
        get "/v1/resources/12345678"
        expect(response.code).to eq("404")
      end

      describe "private resources" do
        let(:resource) { create :resource, visibility: "private", user: user }

        it "403s for anonymous users" do
          get "/v1/resources/#{resource.id}"
          expect_response_code_of 403
        end

        it "403s for assigned users" do
          create :assignment, user: other_user, assignable: resource

          api_get "/v1/resources/#{resource.id}", other_user
          expect_response_code_of 403
        end

        it "makes private resources accessible to the owner" do
          api_get "/v1/resources/#{resource.id}", user
          expect_response_code_of 200
        end
      end

      describe "protected resources" do
        let(:resource) { create :resource, visibility: "protected", user: user }
        let(:collection_assignment) do
          create :assignment, user: user
        end

        it "403s for anonymous users" do
          get "/v1/resources/#{resource.id}"
          expect_response_code_of 403
        end

        it "403s for unassigned users" do
          api_get "/v1/resources/#{resource.id}", other_user
          expect_response_code_of 403
        end

        it "allows access to owner" do
          api_get "/v1/resources/#{resource.id}", user
          expect_response_code_of 200
        end

        it "allows access to assignee" do
          create :assignment, user: other_user, assignable: resource

          api_get "/v1/resources/#{resource.id}", other_user
          expect_response_code_of 200
        end

        it "allows access to collection assignee" do
          resource = collection_assignment.assignable.resources.first

          api_get "/v1/resources/#{resource.id}", user
          expect_response_code_of 200
        end
      end
    end

    describe "POST #create" do

      it "requires the user to be signed in" do
        post "/v1/resources", url: url
        expect_response_code_of 403
      end

      it "requires a URL or file" do
        api_post "/v1/resources", user
        expect_response_code_of 400
      end

      it "works with a URL" do
        api_post "/v1/resources", user, url: url
        expect_response_code_of 201
      end

      it "creates a valid resource" do
        api_post "/v1/resources", user, url: url
        expect_response_code_of 201

        expect(json_response["id"]).to match(/\A[-a-z0-9]{36}\z/)
        expect_prerender_record(latest)
      end

      it "stores the creating user ID" do
        api_post "/v1/resources", user, url: url

        resource_from_db = Resource.find_by_url(url)
        expect(resource_from_db.user_id).to eq(user.id)
      end

      it "works with a file" do
        expect(UploadedFile).to receive(:create).and_return(
          double(url: "http://its.a.file/yay.png"))

        api_post "/v1/resources", user, file: file
        expect_response_code_of 201
      end

      describe "content" do

        it "works with html content" do
          content_params = [{ kind: "html", content: "<h1>Title</h1>" }, { kind: "html", content: "<p>Content</p>" }]
          api_post "/v1/resources", user, name: "My Content", content: content_params

          expect_response_code_of 201
          resource = Resource.find(json_response["id"])
          blocks = resource.content_blocks

          expect(resource.user_id).to eq user.id
          expect(resource.name).to eq "My Content"
          expect(resource.visibility).to eq "private"
          expect(resource.kind).to eq "learning_product"
          expect(blocks.count).to eq 2
          expect(blocks.map(&:kind)).to eq ["html", "html"]
          expect(blocks.map(&:content)).to eq ["<h1>Title</h1>", "<p>Content</p>"]
        end

        it "sanitizes incoming html content" do
          content_params = [{ kind: "html", content: dirty_html }]
          api_post "/v1/resources", user, name: "My Content", content: content_params

          content = json_response["content_blocks"][0]["content"]
          expect(content).to eq clean_html
        end

        it "works with file content" do
          content_params = [{ kind: "file", file: file }]
          api_post "/v1/resources", user, name: "My File", content: content_params

          expect_response_code_of 201
          resource = Resource.find(json_response["id"])
          block = resource.content_blocks.first

          expect(block.kind).to eq "file"
          expect(block.uploaded_file).to be_present
          expect(block.uploaded_file.file.to_s).to match(/pixel.png/)
        end

        it "works with uploaded file IDs" do
          content_params = [{ kind: "file", uploaded_file_id: uploaded_file.id }]
          api_post "/v1/resources", user, name: "My File", content: content_params

          expect_response_code_of 201
          resource = Resource.find(json_response["id"])
          block = resource.content_blocks.first

          expect(block.kind).to eq "file"
          expect(block.uploaded_file).to be_present
          expect(block.uploaded_file.file.to_s).to match(/pixel.png/)
        end

      end

      it "requires url XOR file" do
        api_post "/v1/resources", user, url: url, file: "fake_file"
        expect_response_code_of 400
      end

      it "requires the URL to be http:// or https://" do
        api_post "/v1/resources", user, url: "htp://invalid.url"
        expect_response_code_of 400
      end

      it "requires the URL to be non-blank" do
        api_post "/v1/resources", user, url: ""
        expect_response_code_of 400
      end

      it "normalizes the URL" do
        input_url = "http://xyz.com//../foo#hashtag"
        normalized_url = "http://xyz.com/foo"

        api_post "/v1/resources", user, url: input_url

        expect(json_response["url"]).to eq(normalized_url)
      end

      it "returns a resource if it already exists" do
        url = "https://www.youtube.com/watch?v=kWOAHIpmLAI"
        existing_resource = create :resource, url: url

        api_post "/v1/resources", user, url: url
        expect(json_response["id"]).to eq(existing_resource.id)
      end

      it "returns a url, kind, name, price, owner, and image_url" do
        url = "https://vimeo.com/8906362"
        api_post "/v1/resources", user, url: url

        expect(json_response["url"]).to eq(url)
        expect(json_response["kind"]).to eq("video")
        expect(json_response["name"]).to eq("name")
        expect(json_response["price"]).to eq("price")
        expect(json_response["owner"]).to eq("owner")
        expect(json_response["image_url"]).to eq("image_url")
      end

      describe "ibooks" do

        it "works for ibooks" do
          url = "https://itunes.apple.com/us/book/the-martian/id721429965?mt=11"
          api_post "/v1/resources", user, url: url

          expect(json_response["kind"]).to eq("ibook")
        end

        it "works for 'made for ibooks'" do
          url = "https://itunes.apple.com/us/book/encyclopedia-of-dinosaurs/id553088204?mt=13"
          api_post "/v1/resources", user, url: url

          expect(json_response["kind"]).to eq("ibook")
        end

      end
    end

    describe "PUT #update" do

      let(:resource) { create :resource, name: "Old Name", url: "http://abcd.com", visibility: "public" }

      it "requires the user to be signed in" do
        put "/v1/resources/#{resource.id}", name: "New Name"
        expect_response_code_of 403
      end

      it "allows the creator to update" do
        resource.update_attribute :user_id, user.id
        api_put "/v1/resources/#{resource.id}", user, name: "New Name"

        expect_response_code_of 200
        expect(json_response["name"]).to eq "New Name"
        expect_prerender_record(resource)
      end

      it "does not allow a non-creator to update" do
        api_put "/v1/resources/#{resource.id}", user, name: "New Name"

        expect_response_code_of 403
      end

      it "does not allow updates of the url" do
        resource.update_attribute :user_id, user.id
        api_put "/v1/resources/#{resource.id}", user, name: "New Name", url: "http://nope.com"

        expect_response_code_of 200
        expect(json_response["url"]).to eq "http://abcd.com"
      end
    end

    it "gets trending resources" do
      create_list :chat_resource, 10

      get "/v1/resources/trending"
      expect_response_code_of 200
      expect(json_response.count).to eq 10
    end
  end
end

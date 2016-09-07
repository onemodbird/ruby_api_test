require "rails_helper"

describe Appo::Api::LibraryResources do

  def use *args
    # the arguments to use should be defined in let blocks which will
    # create the collections, then we import and refresh to make sure all
    # are available to search
    LibraryResource.create_index!
    LibraryResource.import
    LibraryResource.refresh_index!
  end

  let(:id) { rand(1..9999) }
  let(:json) {
    { id: id, item_title: "Title #{id}" }.to_json
  }
  let(:library_resource) {
    LibraryResource.create! json: { item_title: "Hey" }
  }

  describe "POST /library_resources" do
    it "creates a new record" do
      expect { post "/v1/library_resources", json: json }
        .to change(LibraryResource, :count).from(0).to(1)
    end
  end

  describe "DELETE /library_resources/:id" do
    it "deletes a record" do
      library_resource
      expect { delete "/v1/library_resources/#{library_resource.id}" }
        .to change(LibraryResource, :count).from(1).to(0)
    end
  end

  describe "GET /library_resources/search" do
    it "is searchable" do
      use library_resource

      get "/v1/library_resources/search", q: "hey"

      expect_response_code_of(200)
      expect(json_response.fetch("total")).to eq(1)
    end
  end

end

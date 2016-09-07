module Appo
  module Api
    class LibraryResources < Grape::API

      desc "Add or update a library resource"
      params do
        requires :json, type: String, allow_blank: false
      end
      post "library_resources" do
        json = JSON.parse(p.json)
        library_resource =
          LibraryResource.find_or_initialize_by(id: json.fetch("id"))

        library_resource.json = json
        library_resource.save!
      end



      desc "Delete a library resource"
      params do
        requires :id, type: Integer
      end
      delete "library_resources/:id" do
        LibraryResource.find_by!(id: p.id).destroy
      end



      desc "Search VIF Resource Library"

      params do
        optional :q, type: String, desc: "Search query"
        optional :page, type: Integer, desc: "Page"
      end

      route_setting :track, event: :resource_library_search, data: [:q]

      get "library_resources/search" do
        query = {
          query: {
            multi_match: {
              query: p.q,
              fields: [
                "item_title^2.0",
                "extrafield_tags^1.0",
                "extrafield_keyword^0.5",
              ]
            }
          }
        }

        response = LibraryResource.search(query).page(p.page).per(10).response["hits"]

        response.library_resources = response.delete("hits")
        response.library_resources.map!{|hit| hit["_source"]}
        response.delete("max_score")

        response
      end

    end
  end
end

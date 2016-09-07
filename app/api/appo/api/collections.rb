module Appo
  module Api
    class Collections < Grape::API
      resource :collections do
        desc "Query collections"

        route_setting :track, event: :collection_search, data: [:q, :tag]

        params do
          optional :q, type: String
          optional :tag, type: String
          optional :user_id, type: String
          optional :page, type: Integer, default: 1
          optional :per, type: Integer, default: 12, values: 1..12
        end

        get "/" do
          if p.user_id
            user = User.find(p.user_id)
            public_only = user != current_user
            results = user.editable_collections(public_only).order(updated_at: :desc).page(p.page).per(p.per)
            count = results.total_count
            total_pages = results.total_pages
            collections = CollectionSerializer.list(results)

          else
            query = Appo::Search::CollectionQuery.new(
              params: Appo::Search::Params.new_from_params(params),
              tag: params[:tag]
            ).to_h

            search_response =
              Collection.search(query).page(p.page).per(p.per)

            count = search_response.total_count
            total_pages = search_response.total_pages
            collections = search_response.results.map{|r| r.fetch("_source") }
          end

          resp = {
            results: collections,
            count: count,
            tags: Collection.index_tags,
            page: {
              total: total_pages,
              current: p.page.to_i
            }
          }
          resp[:user] = UserSimpleSerializer.serialize(user) if user
          resp
        end

        group do
          before_validation do
            if params.collection && params.collection.tags.is_a?(String)
              params.collection.tags = params.collection.tags.split(",").map(&:strip)
            end
          end

          desc "Create a new collection"

          params do
            requires :collection, type: Hash do
              requires :name, type: String
              optional :description, type: String
              optional :visibility, type: String, values: %w{public hidden private}
              optional :resources, type: Array do
                requires :id, type: String
                optional :comment, type: String
              end
              optional :tags, type: Array
            end
          end

          post do
            authorize! :create, Collection
            collection = Collection.create_with_resources!(current_user.id, included_params.collection)
            PrerenderHelper.update_record! collection

            collection
          end

          desc "Update a collection"

          params do
            requires :collection, type: Hash do
              optional :name, type: String
              optional :description, type: String
              optional :visibility, type: String, values: %w{public hidden private}
              optional :resources, type: Array do
                requires :id, type: String
                optional :comment, type: String
              end
              optional :tags, type: Array
            end
          end

          put ":id" do
            collection = Collection.find(params[:id])
            authorize! :update, collection

            included_params.collection.delete :visibility unless current_user.can?(:visibility, collection)
            collection.update_attributes included_params.collection
            PrerenderHelper.update_record! collection

            collection
          end
        end

        route_param :collection_id do
          after_validation do
            @collection = Collection.find(params[:collection_id])
          end

          desc "Get a collection"

          route_setting :track, event: :collection_view, data: :collection_id

          params do
            optional :collaboration_token, type: String
          end
          get serializer: CollectionWithTranscriptSerializer do
            if params[:collaboration_token].present? && Collaboration.exists?(
              token: params[:collaboration_token],
              collaboratable_id: params[:collection_id])

              @collection
            elsif
              authorize! :show, @collection

              @collection
            end
          end

          desc "Get paginated resources from a collection"

          params do
            optional :page, type: Integer
            optional :per, type: Integer
            optional :after_resource, type: Integer
            exactly_one_of :page, :after_resource
          end
          get "resources" do
            authorize! :show, @collection

            resources = p.after_resource ?
              @collection.collection_resources.offset(p.after_resource).limit(p.per || 50) :
              @collection.collection_resources.page(p.page).per(p.per || 50)
            CollectionResourceDecoratorSerializer.list(resources)
          end

          desc "Delete a collection"
          delete do
            authorize! :destroy, @collection
            @collection.destroy
          end
        end
      end
    end
  end
end

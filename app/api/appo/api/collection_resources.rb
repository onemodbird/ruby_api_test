module Appo
  module Api
    class CollectionResources < Grape::API
      resource "collections/:collection_id/resources" do
        after_validation do
          @collection = Collection.find(params[:collection_id])
          authorize! :update, @collection
        end

        desc "Add a resource to a collection"
        route_setting :track, event: :collection_resource_create, data: [:collection_id, :id]
        params do
          requires :id, type: String
        end
        post do
          @collection.add_resource(current_user, included_params.id)
          PrerenderHelper.update_record! @collection

          included_params
        end

        route_param :id do
          desc "Delete a resource from a collection"
          route_setting :track, event: :collection_resource_delete, data: [:collection_id, :id]
          params do
            requires :id, type: String
          end
          delete do
            @collection.remove_resource current_user, included_params.id
            PrerenderHelper.update_record! @collection

            { deleted: params[:id] }
          end

          desc "Updates a resource in a collection"
          params do
            optional :description, type: String
            optional :position, type: Integer
            at_least_one_of :description, :position
          end
          put do
            @collection.update_resource current_user, params[:id], included_params
            PrerenderHelper.update_record! @collection

            included_params.merge(id: params[:id])
          end
        end
      end
    end
  end
end

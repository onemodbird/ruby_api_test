module Appo
  module Api
    class CollectionGroups < Grape::API

      resource :collection_groups do

        desc "List collection groups belonging to the current user"
        get do
          authorize! :read, CollectionGroup
          cgs = CollectionGroup.where(user_id: current_user.id).order(:name)
          { collection_groups: serialize(cgs) }
        end

        desc "Add a collection group for the current user"
        params do
          requires :name, type: String
          optional :collections, type: Array do
            requires :id, type: String
          end
        end
        post do
          authorize! :create, CollectionGroup
          CollectionGroup.create! included_params.merge(user: current_user)
        end

      end

      resource "collection_groups/:id" do
        after_validation do
          @collection_group = CollectionGroup.find(params[:id])
        end

        desc "Find a collection group"
        get do
          authorize! :read, @collection_group
          @collection_group
        end

        desc "Update a collection group"
        params do
          optional :name, type: String
          optional :collections, type: Array do
            requires :id, type: String
          end
        end
        put do
          authorize! :update, @collection_group
          @collection_group.update! included_params
        end

        desc "Delete a collection group"
        delete do
          authorize! :destroy, @collection_group
          @collection_group.destroy!
        end

      end

    end
  end
end


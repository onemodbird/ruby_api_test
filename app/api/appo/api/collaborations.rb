module Appo
  module Api
    class Collaborations < Grape::API

      resources :collaborations do

        # Create
        route_setting :track, event: :collaboration_create, data: "collection_id"

        params do
          optional :collection_id, type: String
          exactly_one_of :collection_id

          optional :email, type: String, regexp: User::EMAIL_REGEX
          optional :collaborator_id, type: String
          optional :bulk, type: Hash do
            optional :emails, type: Array[String]
            optional :collaborator_ids, type: Array[String]
            at_least_one_of :emails, :collaborator_ids
          end
          exactly_one_of :email, :collaborator_id, :bulk

          optional :message, type: String
        end

        post do
          collaboratable = Collection.find(p.collection_id)

          authorize! :collaborate, collaboratable

          emails, collaborator_ids = [
            p.bulk ? p.bulk.emails : p.email,
            p.bulk ? p.bulk.collaborator_ids : p.collaborator_id ]

          collaborations = Collaboration.invite!(
            collaboratable,
            message: p.message,
            emails: emails,
            collaborator_ids: collaborator_ids)

          { collaborations: serialize(collaborations) }
        end


        # Confirm

        route_setting :track, event: :collaboration_confirm

        params do
          requires :token, type: String, allow_blank: false
        end

        post :confirm do
          authorize! :confirm, Collaboration

          collaboration = Collaboration.find_by(token: p.token)

          if collaboration && current_user.can?(:edit, collaboration.collaboratable)
            { success: true }
          elsif collaboration && collaboration.confirm(current_user, p.token)
            { success: true }
          else
            if collaboration
              error!({ error: "This invite has already been accepted by another user. Please ask the owner to create a new invite." }, 404)
            else
              error!({ error: "Invite not found. Please ask the owner to create a new invite." }, 404)
            end
          end
        end



        # Delete

        route_setting :track, event: :collaboration_delete, data: :id

        route_param :id do

          delete do
            collaboration = Collaboration.find(params[:id])
            authorize! :destroy, collaboration
            collaboration.destroy
          end

        end

      end
    end
  end
end

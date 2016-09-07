module Appo
  module Api
    class Users < Grape::API

      resources :users do

        get do
          users = User.search("visible:true", size: 1000)
            .results
            .map{|r|
              r.fetch("_source").select{|k,v|
                %w(id name profile_photo_url).include?(k)
              }
            }
            .sort_by{|u| u.fetch("name")}

          { users: users }
        end

        desc "User name autocomplete"
        params do
          requires :name, type: String, allow_blank: false
        end
        get "autocomplete" do
          { users: User.autocomplete_search(p.name) }
        end

        # Create a user

        params do
          requires :user, type: Hash do
            requires :name, type: String
            requires :provider, type: String
            requires :provider_token, type: String
          end
        end

        post "/", serializer: UserSessionSerializer do
          begin
            user = Authentication::Authenticator.register(
              p["user"]["provider"],
              p["user"]["provider_token"],
              {
                name: p["user"]["name"],
                auth_token: params[:auth_token]
              }
            )
          rescue Authentication::AuthErrorTryLogin => e
            error!({ error: e.message, suggest: "login" }, 422)
          rescue Authentication::AuthError => e
            error!({ error: e.message }, 422)
          end

          error!({ error: user.errors.full_messages.first }, 422) unless user.valid?

          Tracking.identify(user, request)
          Tracking.page(user, "/user/create", request)

          user
        end

        route_param :id do

          get do
            user = User.find(params[:id])
            authorize! :show, user

            serialize(user)
          end

          put :send_confirmation_email do
            user = User.find(params[:id])
            authorize! :update, user
            user.send_confirmation_instructions
            { success: true }
          end

          params do
            requires :provider, type: String
            requires :provider_token, type: String
          end
          put :connect, serializer: UserConnectionSerializer do
            user = User.find(params[:id])
            authorize! :update, user

            begin
              Authentication::Authenticator.connect_provider(current_user,
                params[:provider], params[:provider_token])
            rescue Authentication::AuthError => e
              error!({ error: e.message }, 403)
            rescue
              ErrorNotification.notify($!)
              error!({ error: "Connection failed." }, 403)
            end

          end

          desc "Get a learner"
          params do
            requires :id, type: String
          end
          route_setting :track, event: :learner_list
          get "learnings" do
            if Demo::VifDemoUser.intercept?(current_user)
              Demo::VifDemoUser.learner(p.id)
            else
              learner = User.find(p.id)

              authorize! :assign, learner
              LearnerSerializer.serialize(learner)
            end
          end
          # Update a user

          params do
            requires :user, type: Hash do
              optional :name, type: String
              optional :email, type: String, regexp: User::EMAIL_REGEX
              optional :lede, type: String
              optional :bio, type: String
              optional :google_profile_id, type: String
              optional :external_profile_url_1, type: String
              optional :external_profile_url_2, type: String
              optional :email_notifications, type: Boolean
              optional :password, type: String
              optional :expertise_tags, type: Array
              optional :grade_levels, type: Array, values: Appo::ResourceTags::GRADES
              optional :avatar, type: Rack::Multipart::UploadedFile
            end
          end

          before_validation do
            params.user.delete :email if params.user && params.user.email.blank?
          end

          put do
            user = User.find(params[:id])
            authorize! :update, user

            params.user.delete :password if user.encrypted_password.present?
            user.update_attributes included_params.user
            user
          end
        end
      end
    end
  end
end

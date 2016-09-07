module Appo
  module Api
    class Passwords < Grape::API

      resources :passwords do

        desc "Request a forgot password email"

        params do
          requires :email, type: String
        end

        route_setting :track, event: :password_reset_request

        post "/" do
          User.find_by_email(included_params.email).try :send_reset_password_instructions
          { success: true }
        end

        route_param :reset_password_token do

          desc "Submit a new password for a given reset password token"

          params do
            requires :password, type: String
            requires :password_confirmation, type: String
          end

          route_setting :track, event: :password_reset

          put do
            if params.password == params.password_confirmation
              resource = User.reset_password_by_token(params)
              if resource.errors.present?
                error!({ error: resource.errors }, 400)
              else
                resource
              end
            else
              error!({ error: "Password must match confirmation." }, 400)
            end
          end
        end

      end
    end
  end
end

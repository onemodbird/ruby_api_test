module Appo
  module Api
    class Sessions < Grape::API
      resources :sessions do

        params do
          requires :auth_token, type: String
        end
        post "/", serializer: UserSessionSerializer do
          session = Session.new(params[:auth_token])
          error!({ error: session.error }, 403) if session.error

          session.user
        end

        params do
          requires :provider, type: String
          requires :provider_token, type: String
        end
        post "/login", serializer: UserSessionSerializer do
          begin
            session = Authentication::Authenticator.login(
              params[:provider], params[:provider_token])

            Tracking.identify(session.user, request)

            session.user
          rescue Authentication::AuthErrorTryRegistration => e
            error!({ error: e.message, suggest: "registration" }, 403)
          rescue Authentication::AuthError => e
            error!({ error: e.message }, 403)
          rescue
            ErrorNotification.notify($!)
            error!({ error: "Login failed." }, 403)
          end
        end
      end
    end
  end
end

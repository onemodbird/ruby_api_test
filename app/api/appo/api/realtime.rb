module Appo
  module Api
    class Realtime < Grape::API
      resource :realtime do
        def current_ability
          @current_ability ||= AbilityRealtime.new(current_user)
        end

        desc "Authenticate realtime communication"
        params do
          requires :channel_name, type: String
        end
        post :auth do
          authorize! :read, RealtimeService.model_for(params[:channel_name])

          status 200
          RealtimeService.authenticate(params[:channel_name], params)
        end
      end
    end
  end
end

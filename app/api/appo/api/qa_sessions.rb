module Appo
  module Api
    class QASessions < Grape::API

      resources :qa_sessions do
        after_validation do
          require_user!
        end

        desc "Show Question & Answer Session"
        route_setting :track, event: :qa_session_view, data: :id
        params do
          requires :id, type: String, allow_blank: false
        end
        get ":id" do
          QASession.find(p.id)
        end
      end

    end
  end
end

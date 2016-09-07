module Appo
  module Api
    class ChatInvitations < Grape::API
      resource :chat_invitations do
        # Authenticated endpoints
        group do
          before_validation do
            require_user!
          end

          desc "Invite email(s) to a chat"
          params do
            requires :chat_id, type: String, allow_blank: false
            requires :emails, type: Array[String], allow_blank: false
          end
          post do
            ChatInvitation.create_multiple(p.emails, user_id: current_user.id, chat_id: p.chat_id)
          end

          desc "Accept an invitation"
          params do
            requires :token, type: String, allow_blank: false
          end
          post :accept do
            invitation = ChatInvitation.find_by!(token: p.token)
            invitation.accept(current_user)

            body false
          end
        end
      end
    end
  end
end

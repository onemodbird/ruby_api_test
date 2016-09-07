module Appo
  module Api
    class ScheduledMessages < Grape::API
      helpers do
        def capture_twitter_auth_token(token)
          current_user.twitter_auth_token = token
          current_user.save(validate: false) if current_user.changed?
        end
      end

      resources :scheduled_messages do
        after_validation do
          require_user!
        end

        desc "List a user's currently scheduled messages"
        route_setting :track, event: :scheduled_messages_list
        get do
          current_user.scheduled_messages.active
        end

        desc "Create a scheduled message"
        route_setting :track, event: :scheduled_message_create
        params do
          requires :text, type: String, allow_blank: false
          requires :scheduled_at, type: Integer, allow_blank: false
          requires :token, type: String, allow_blank: false
          optional :image_file, type: Rack::Multipart::UploadedFile
        end
        post do
          capture_twitter_auth_token p.token

          # Without the explicit call to the serializer, the image_url
          # atribute was blank.  Not sure why at this point, but the explicit
          # serialization works... ¯\_(ツ)_/¯
          scheduled_message =
            ScheduledMessage.create! p.except(:token).merge(user: current_user)
          ScheduledMessageSerializer.serialize(scheduled_message)
        end

        route_param :id do
          desc "Delete a scheduled message"
          route_setting :track, event: :scheduled_message_delete
          params do
            requires :id, type: String, allow_blank: false
          end
          delete do
            scheduled_message = ScheduledMessage.find(p.id)

            authorize! :destroy, scheduled_message
            scheduled_message.cancel
          end

          desc "Update a scheduled message"
          route_setting :track, event: :scheduled_message_update
          params do
            requires :id, type: String, allow_blank: false
            requires :token, type: String, allow_blank: false

            optional :text, type: String, allow_blank: false
            optional :scheduled_at, type: Integer, allow_blank: false
            optional :image_file, type: Rack::Multipart::UploadedFile
            at_least_one_of :text, :scheduled_at, :image_file
          end
          put do
            capture_twitter_auth_token p.token

            scheduled_message = ScheduledMessage.find(p.id)
            authorize! :updated, scheduled_message

            new_scheduled_message =
              scheduled_message.replace(p.except(:id, :token))

            # see note in POST/create about explicit serialization
            ScheduledMessageSerializer.serialize(new_scheduled_message)
          end
        end
      end
    end
  end
end

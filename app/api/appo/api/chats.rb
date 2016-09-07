module Appo
  module Api
    class Chats < Grape::API

      # Unauthenticated endpoints
      resources :chats do
        desc "List chats"
        route_setting :track, event: :chat_list
        params do
          optional :simple, type: Boolean
          optional :exclude_archived, type: Boolean
        end
        get do
          if p.simple
            chats = p.exclude_archived ? Chat.current : Chat.order(name: :asc)
            { chats: chats.pluck(:name) }
          else
            Rails.cache.fetch("chats/list", expires_in: 5.minutes) do
              chats = Chat.order(name: :asc)
              schedule_occurrences = ScheduleOccurrence.calendar_view

              {
                chats: ChatSimpleSerializer.list(chats),
                schedule_occurrences: serialize(schedule_occurrences)
              }
            end
          end
        end

        desc "List all chat messages"
        params do
          optional :before_chat_message_id, type: String
          optional :limit, type: Integer, values: (1..1000), default: 100
        end
        get "messages" do
          chat_messages = ChatMessage.latest(p.limit, p.before_chat_message_id).reverse
          { chat_messages: serialize(chat_messages) }
        end

        desc "Chat search"
        params do
          requires :q, type: String, allow_blank: false
        end
        get "search" do
          { chats: serialize(Chat.basic_search(p.q)) }
        end

        desc "Show chat"
        route_setting :track, event: :chat_view, data: :id
        params do
          requires :id, type: String, allow_blank: false
          optional :include_qa_session, type: Boolean
          optional :include_summaries, type: Boolean
          optional :include_participants, type: Boolean
        end
        get ":id" do
          chat = p.id.match(Appo::Regex::UUID) ? Chat.find(p.id) : Chat.find_by!(name: "##{p.id}")

          mmts = {}

          data = measure(mmts, :chat) { serialize(chat) }
          data[:handles] = measure(mmts, :handles) { chat.recent_twitter_handles }
          data[:qa_session] = measure(mmts, :qa) { serialize(chat.current_qa_session) } if p.include_qa_session
          data[:summaries] = measure(mmts, :summaries) { serialize(chat.summaries.limit(10)) } if p.include_summaries
          data[:measurements] = mmts

          data
        end

        desc "List messages in a chat"
        params do
          requires :id, type: String, allow_blank: false
          optional :before_chat_message_id, type: String
          optional :limit, type: Integer, values: (1..1000), default: 100
        end
        get ":id/messages" do
          mmts = {}

          chat_messages = measure(mmts, :messages) do
            Chat.find(p.id)
              .chat_messages
              .includes(:user)
              .latest(p.limit, p.before_chat_message_id)
              .order(tweeted_at: :desc)
              .reverse
          end

          { chat_messages: serialize(chat_messages), measurements: mmts }
        end
      end

      # Authenticated endpoints
      resources :chats do
        after_validation do
          require_user!
        end

        desc "Update a chat"
        params do
          requires :id, type: String, allow_blank: false
          optional :spammer_id, type: String, allow_blank: false, desc: "Twitter id of a spammer"
          optional :moderator_list, type: String, allow_blank: false, desc: "Comma delimited list of chat moderators"
          optional :description, type: String, allow_blank: true, desc: "The current chat description"
          optional :schedule_duration, type: String
          optional :schedule_times, type: Array[String]
          optional :schedule_rules, type: Array[String]
        end
        put ":id" do
          chat = Chat.find(p.id)
          authorize! :update, chat

          if p.spammer_id.present?
            chat.add_spammer(p.spammer_id, current_user.id)
          end

          Schedulable::Params.apply(chat, p)

          updates = p.slice(:moderator_list, :description)

          if updates[:moderator_list].present?
            updates[:moderator_list] =
              "#{updates[:moderator_list]}, @#{current_user.twitter_username}"
          end

          chat.update(updates)

          ChatSerializer.serialize(chat)
        end

        desc "Post a message to chat"
        params do
          requires :id, type: String, allow_blank: false
          requires :text, type: String, allow_blank: false
        end
        post ":id/messages" do
          attributes = {
            user: current_user,
            text: p.text,
            sent_at: Time.zone.now }

          Chat.find(p.id).chat_messages.create!(attributes)
        end

        desc "Update a message, primarily for spam flagging"
        params do
          requires :id, type: String, allow_blank: false
          requires :tweet_id, type: String, allow_blank: false
          requires :spam, type: Boolean
        end
        put ":id/messages/:tweet_id" do
          authorize! :update, Chat.find(p.id)
          ChatMessage.find_by(tweet_id: p.tweet_id, chat_id: p.id).flag(current_user, p.spam)

          body false
        end
      end

    end
  end
end

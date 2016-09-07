module Appo
  module Api
    class Transcripts < Grape::API
      resource :transcripts do
        desc "List transcripts"

        route_setting :track, event: :transcript_list

        params do
          optional :chat_id, type: String
          optional :user_id, type: String
          optional :page, type: Integer, default: 1
          optional :per, type: Integer, default: 20, values: 1..20
          at_least_one_of :chat_id, :user_id
        end

        get "/" do
          transcripts = Transcript.order(created_at: :desc).page(params[:page]).per(params[:per])
          transcripts = transcripts.where(chat_id: p.chat_id) if p.chat_id.present?
          transcripts = transcripts.where(user_id: p.user_id) if p.user_id.present?

          {
            results: serialize(transcripts),
            page: {
              total: transcripts.total_pages,
              current: (params[:page] || 1).to_i
            }
          }
        end

        desc "Create a transcript of a chat"

        route_setting :track, event: :transcript_create, data: [:q, :tag]

        params do
          requires :begin_at, type: Integer
          requires :chat_id, type: String
          optional :name, type: String
          optional :end_at, type: Integer
          optional :duration, type: Integer
          at_least_one_of :end_at, :duration
        end

        post do
          require_user!

          end_at = p.end_at || p.begin_at + p.duration.minutes

          transcript = Transcript.create(
            begin_at: Time.at(p.begin_at),
            end_at: Time.at(end_at),
            chat_id: p.chat_id,
            user_id: current_user.id,
            name: p.name
            )

          # Made synchronous for the moment until we can pusher it and
          # update the UI for longer timelines
          CollectionCreateJob.new.perform(transcript.id)

          transcript
        end

        route_param :id do
          after_validation do
            @transcript = Transcript.find(p.id)
          end

          desc "View transcript information"

          route_setting :track, event: :transcript_view, data: [:id]

          params do
            requires :id, type: String, allow_blank: false
          end

          get do
            data = serialize(@transcript)
            data[:chat_messages] = serialize(@transcript.ordered_messages)
            data[:qa_sessions] = serialize(@transcript.qa_sessions)
            data
          end

          desc "Create a collection for this transcript"

          route_setting :track, event: :transcript_collection, data: [:id]

          params do
            requires :id, type: String, allow_blank: false
          end

          post "/collection" do
            if @transcript.collection.nil?
              error!({ error: "Collection is not quite ready yet." }, 404)
            else
              { id: @transcript.collection.id, name: @transcript.collection.name }
            end
          end

          desc "Update a transcript"

          params do
            requires :id, type: String, allow_blank: false
            requires :name, type: String, allow_blank: false
          end

          put do
            authorize! :update, @transcript

            @transcript.update_attributes(name: p.name)
            @transcript
          end

          desc "Remove a chat message from a transcript"

          route_setting :track, event: :transcript_chat_message_delete, data: [:id]

          params do
            requires :id, type: String, allow_blank: false
            requires :chat_message_id, type: String, allow_blank: false
          end

          delete "/chat_messages/:chat_message_id" do
            authorize! :update, @transcript
            @transcript.omit_message_id(p.chat_message_id)

            body false
          end
        end
      end
    end
  end
end

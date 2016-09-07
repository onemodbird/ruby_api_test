require "rails_helper"

describe Appo::Api::Transcripts do

  let(:user) { create :user }
  let(:user2) { create :user }

  let(:chat) { create :chat, :with_messages }
  let(:chat2) { create :chat, :with_messages }

  let(:q_and_a) {
    create :question_and_answer,
      :question_with_answer,
      chat_message: chat.chat_messages[0] }

  let(:transcript) { create :transcript, chat: chat, user: user }

  describe "GET /transcripts" do
    it "lists a users transcripts" do
      transcripts = create_list :transcript, 2, chat: chat, user: user
      garbage = create :transcript, chat: chat, user: user2

      get "/v1/transcripts", { user_id: user.id }

      expect_response_code_of 200
      expect(json_response["results"]).to match_ids_of transcripts
    end

    it "lists a chats transcripts" do
      transcripts = create_list :transcript, 2, chat: chat, user: user
      garbage = create :transcript, chat: chat2, user: user

      get "/v1/transcripts", { chat_id: chat.id }

      expect_response_code_of 200
      expect(json_response["results"]).to match_ids_of transcripts
    end

    it "requires a user or chat id" do
      get "/v1/transcripts"

      expect_response_code_of 400
      expect(json_response["error_message"]).to eq "Chat_id, user_id are missing, at least one parameter must be provided"
    end
  end

  describe "POST /transcripts" do
    it "creates a transcript and generates a collection" do
      api_post "/v1/transcripts", user, {
        begin_at: (Time.now - 1.hour).to_i,
        end_at: Time.now.to_i,
        chat_id: chat.id
      }

      expect_response_code_of 201
      expect(json_response["name"]).to eq chat.name
      expect(Transcript.first.collection_id).to_not be_nil
    end

    it "creates a transcript with a duration and generates a collection" do
      begin_at = (Time.now - 1.hour).to_i

      api_post "/v1/transcripts", user, {
        begin_at: begin_at,
        duration: 60,
        chat_id: chat.id
      }

      expect_response_code_of 201
      expect(json_response["name"]).to eq chat.name
      expect(json_response["end_at_i"]).to eq begin_at + 60.minutes
      expect(Transcript.first.collection_id).to_not be_nil
    end

    it "allows a name to be specified" do
      api_post "/v1/transcripts", user, {
        begin_at: (Time.now - 1.hour).to_i,
        end_at: Time.now.to_i,
        chat_id: chat.id,
        name: "Test!"
      }

      expect(json_response["name"]).to eq "Test!"
    end
  end

  describe "GET /transcripts/:id" do
    it "gets the full transcript" do
      q_and_a
      get "/v1/transcripts/#{transcript.id}"

      expect_response_code_of 200
      expect(json_response.keys).to include("user", "begin_at_i", "end_at_i", "chat")
      expect(json_response["chat_messages"].count).to eq chat.chat_messages.count

      expect(json_response["qa_sessions"].count).to eq(1)
      expect(json_response.dig("qa_sessions", 0, "questions").count).to eq(1)
      expect(json_response.dig("qa_sessions", 0, "questions", 0, "answers").count).to eq(1)
    end
  end

  describe "POST /transcripts/:id/collection" do
    it "sends error if collection not yet generated" do
      api_post "/v1/transcripts/#{transcript.id}/collection", user

      expect_response_code_of 404
      expect(json_response).to eq({"error" => "Collection is not quite ready yet."})
    end

    it "generates a collection for a transcript" do
      transcript.generate_collection
      api_post "/v1/transcripts/#{transcript.id}/collection", user

      expect_response_code_of 201
      expect(json_response).to eq(
        {"id" => transcript.collection.id, "name" => transcript.collection.name})
    end
  end

  describe "PUT /transcripts/:id" do
    it "updates the name of a transcript" do
      api_put "/v1/transcripts/#{transcript.id}", user, name: "updated"
      expect(transcript.reload.name).to eq "updated"
      expect(json_response["name"]).to eq "updated"
    end

    it "does not allow me to update another's transcript" do
      api_put "/v1/transcripts/#{transcript.id}", user2, name: "updated"
      expect_response_code_of 403
    end
  end

  describe "DELETE /transcripts/:id/chat_messages/:chat_message_id" do
    it "omits chat messages from a transcript" do
      remove = chat.chat_messages.first
      api_delete "/v1/transcripts/#{transcript.id}/chat_messages/#{remove.id}", user

      get "/v1/transcripts/#{transcript.id}", { include_messages: true }
      expect(json_response["chat_messages"]).to match_ids_of (chat.chat_messages - [remove])
    end

    it "does not allow omissions from another's transcript" do
      api_delete "/v1/transcripts/#{transcript.id}/chat_messages/1234", user2

      expect_response_code_of 403
    end
  end
end

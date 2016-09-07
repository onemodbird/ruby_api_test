require "rails_helper"

describe ChatMessageSerializer do
  let(:serialized) do
    ChatMessageSerializer.serialize(chat_message)
  end

  context "with a quoted chat_message" do
    let(:retweeted_chat_message) {
      create :chat_message,
        chat: nil,
        retweeted_chat_message: create(:chat_message, chat: nil)
    }

    let(:chat_message) {
      create :chat_message, retweeted_chat_message_id: retweeted_chat_message.id
    }

    it "includes the quoted chat message" do
      expect(serialized[:quoted_chat_message]).to eq (
        QuotedChatMessageSerializer.serialize(retweeted_chat_message))
    end

    it "excludes the quoted chat message's quoted chat message" do
      expect(serialized[:quoted_chat_message][:quoted_chat_message]).to eq(nil)
    end

  end
end

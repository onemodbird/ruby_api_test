require "rails_helper"

describe QuotedChatMessageSerializer do
  let(:serialized) do
    QuotedChatMessageSerializer.serialize(chat_message)
  end

  let(:quoted_chat_message) { create :chat_message, chat: nil }
  let(:chat_message) {
    create :chat_message, retweeted_chat_message_id: quoted_chat_message.id
  }

  it "prevents recursion (quoted_chat_message is always nil)" do
    expect(serialized[:quoted_chat_message]).to eq(nil)
  end
end

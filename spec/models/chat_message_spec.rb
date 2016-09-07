require "rails_helper"

RSpec.describe ChatMessage, type: :model do
  let(:moderator) { create :user }
  let(:chat) { create :chat  }
  let(:chat_message) { create :chat_message, :with_resource, chat: chat }

  it "publishes realtime messages to delete spam" do
    expect(RealtimeService)
      .to receive(:publish)
      .with(chat, "chat_message_delete", false, ids: [chat_message.id])

    chat_message.flag(moderator)
  end
end

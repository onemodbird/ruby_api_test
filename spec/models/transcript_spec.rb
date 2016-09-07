require "rails_helper"

describe Transcript do
  let(:chat) { create :chat }
  let(:user) { create :user }
  let(:transcript) { create(:transcript, chat: chat) }

  it "does not allow a transcript over the max time period" do
    transcript = Transcript.create(
      begin_at: Time.now - Transcript::MAX_TIME_PERIOD - 1.minute,
      end_at: Time.now,
      chat: chat,
      user: user
    )

    expect(transcript.errors.messages).to eq ({:end_at=>["must be within 72 hours"]})
  end

  describe "Collection creation" do
    def chat_message!(tweeted_at)
      create :chat_message, :with_resource, tweeted_at: tweeted_at, chat: chat
    end

    def resources_of(chat_messages)
      chat_messages.map{ |cm| cm.resources.all }.flatten
    end

    it "defaults to the name of the chat" do
      expect(transcript.name).to eq chat.name
    end

    it "generates a collection" do
      expect { transcript.generate_collection }
      .to change(Collection, :count).from(0).to(1)
    end

    it "does not generate a duplicate collection" do
      expect { 2.times { transcript.generate_collection } }
      .to change(Collection, :count).from(0).to(1)
    end

    it "includes only resources for the time period" do
      included = [
        chat_message!(transcript.begin_at),
        chat_message!(transcript.end_at)
      ]

      collection = transcript.generate_collection
      expect(collection.resources).to match_array resources_of(included)
    end

    it "does not duplicate resources in a collection" do
      original = chat_message!(transcript.begin_at)
      dupe = create :chat_message, tweeted_at: transcript.begin_at, chat: chat
      dupe.chat_resources.create(resource: original.resources.first, chat: chat)

      collection = transcript.generate_collection
      expect(collection.resources).to match_array original.resources
    end
  end
end

require "rails_helper"

RSpec.describe Chat, type: :model do
  let(:chat) { create :chat, moderators: { "person": { "id": user.twitter_id } }, promos_enabled: true  }
  let(:user) { create :user, :twitter }

  it "is subscribable" do
    subscription = chat.subscribe(user.id)

    expect(subscription.persisted?).to eq(true)
    expect(chat.subscriber?(user.id)).to eq(true)
  end

  it "has a case insensitive name" do
    expect(Chat.where(name: chat.name.upcase).first).to eq chat
  end

  it "normalizes a hashtag" do
    expect(Chat.normalize_hashtag("ItWorks")).to eq "#ItWorks"
    expect(Chat.normalize_hashtag("#ItWorks")).to eq "#ItWorks"
    expect(Chat.normalize_hashtag("##ItWorks")).to eq "#ItWorks"
    expect(Chat.normalize_hashtag('#@AGuy')).to eq "#AGuy"
    expect(Chat.normalize_hashtag("#IHaveASpace ")).to eq "#IHaveASpace"
    expect(Chat.normalize_hashtag(" #IHaveFatFingers")).to eq "#IHaveFatFingers"
  end

  it "sends an adminstrative notification" do
    chat # touch

    expect(mailbox.last.to).to eq [Secrets.admin_address]
    expect(mailbox.last.subject).to eq "[Test] Chat #{chat.name} created."
    expect(mailbox.last.body).to eq "[Test] Chat #{chat.name} created."
  end

  it "archives the chat" do
    chat.archive!

    expect(chat.archived_at).to_not be_nil
    expect(chat.promos_enabled).to eq false
  end

  describe "Gnip callbacks" do

    before :each do
      allow(SyncGnipStreamRulesJob).to receive(:perform_async)
      allow(BackfillChatHistoryJob).to receive(:perform_async)
    end

    describe "Gnip stream rules syncronization" do
      before do
        stub_const("Secrets", Secrets.dup)
        allow(Secrets).to receive(:tweet_streamer).and_return("gnip")
      end

      it "syncs chat names to gnip" do
        expect(SyncGnipStreamRulesJob).to receive(:perform_async)
        chat
      end

      it "skips sync if gnip is not the tweet streamer" do
        allow(Secrets).to receive(:tweet_streamer).and_return("twitter")

        expect(SyncGnipStreamRulesJob).not_to receive(:perform_async)
        chat
      end

      it "skips sync if the chat name is unchanged" do
        chat
        expect(SyncGnipStreamRulesJob).not_to receive(:perform_async)
        chat.update(edcamp: true)
      end

      it "syncs if chat is archived" do
        chat

        expect(SyncGnipStreamRulesJob).to receive(:perform_async)
        chat.archive!
      end
    end

    describe "populating history for a new chat" do
      it "runs if the tweet streamer is gnip" do
        stub_const("Secrets", Secrets.dup)
        allow(Secrets).to receive(:tweet_streamer).and_return("gnip")

        chat

        expect(BackfillChatHistoryJob)
          .to have_received(:perform_async).with(chat.id)
      end

      it "does not run unless the tweet streamer is gnip" do
        # tweet_streamer is "twitter" in test env
        expect(BackfillChatHistoryJob).not_to receive(:perform_async)
        chat
      end
    end
  end

  describe ".current" do
    let!(:chat) { create :chat }

    it "excludes archived chats" do
      create :chat, archived_at: Time.now
      expect(Chat.count).to eq(2)
      expect(Chat.current.count).to eq(1)
    end

    it "retrieves archived chats" do
      archived = create :chat, archived_at: Time.now
      expect(Chat.archived.map(&:id)).to eq([archived.id])
    end

    it "pulls a hash of chats keyed by name" do
      expect(Chat.current_hash).to eq({ chat.name => chat })
      expect(Chat.current_hash(true)).to eq({ chat.name => chat })
    end
  end

  context "with a moderated chat" do
    let(:chat) { create :chat, moderators: { "person": { "id": user.twitter_id } } }

    it "clears moderators" do
      chat.update(moderator_list: nil)
      expect(chat.moderators).to eq({})
    end

    it "reports if a user is a moderator" do
      expect(chat.is_moderator?(user)).to eq true
    end

    it "reports a twitter_id as a spammer" do
      chat.add_spammer("12345")
      expect(chat.is_spammer?("12345")).to eq true
    end

    it "reports a global spammer as a chat spammer" do
      TwitterSpammer.add("54321")
      expect(chat.is_spammer?("54321")).to eq true
    end

    it "publishes a realtime message to delete spam and spammer" do
      chat_message = create :chat_message, chat: chat, twitter_id: "12345", twitter_handle: "spammy"

      expect(RealtimeService)
        .to receive(:publish)
        .with(chat, "chat_user_remove", false, twitter_handle: "spammy")

      expect(RealtimeService)
        .to receive(:publish)
        .with(chat, "chat_message_delete", false, ids: [chat_message.id])

      chat.add_spammer("12345")
    end
  end
end

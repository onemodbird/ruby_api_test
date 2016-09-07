require "rails_helper"
require "shared/schedule_examples"

describe Appo::Api::Chats do
  let(:user) { create :user }
  let(:chat) { create :chat, description: "Dr. Seuss & such" }
  let(:another_chat) { create :chat }
  let(:schedule_occurrence) { create :schedule_occurrence, schedulable: chat }
  let(:summary) { ChatOccurrenceSummary.generate(schedule_occurrence) }

  def message!(params = {})
    create(:chat_message, {chat: chat, tweeted_at: Time.now}.merge(params))
  end

  it "lists chats ordered by name" do
    chats = create_list(:chat, 3).sort_by(&:name)

    get "/v1/chats"

    expect_response_code_of(200)
    expect(json_response["chats"]).to match_ids_of chats
  end

  it "lists just chatnames for a simple listing" do
    chat_names = create_list(:chat, 3).sort_by(&:name).map(&:name)

    get "/v1/chats?simple=true"

    expect_response_code_of(200)
    expect(json_response["chats"]).to eq(chat_names)
  end

  it "excludes archived chats if requested" do
    chat_names = create_list(:chat, 3).sort_by(&:name).map(&:name)
    archived = create(:chat, archived_at: Time.now)

    get "/v1/chats?simple=true&exclude_archived=true"

    expect_response_code_of(200)
    expect(json_response["chats"]).to eq(chat_names)
  end

  it "includes chat schedules for the previous week and the next 3 weeks" do
    Timecop.freeze
    included = [
      create(
        :schedule_occurrence,
        schedulable: chat,
        start_time: Time.now.beginning_of_week(:sunday)),
      create(
        :schedule_occurrence,
        schedulable: chat,
        start_time: Time.now.beginning_of_week(:sunday) + 4.weeks)
    ]
    excluded = create(
      :schedule_occurrence,
      schedulable: chat,
      start_time: 40.days.from_now)

    get "/v1/chats"

    expect(json_response["schedule_occurrences"]).to match_ids_of included
  end

  it "only lists non-archived chats" do
    Timecop.freeze
    scheduled = Time.now + 1.week

    visible = create(:schedule_occurrence, schedulable: chat, start_time: scheduled)
    hidden = create(:schedule_occurrence, schedulable: chat, start_time: scheduled, canceled: true)

    get "/v1/chats"
    expect(json_response["schedule_occurrences"]).to match_ids_of [visible]
  end

  it "lists chat occurrence summaries if requested" do
    summary #touch

    api_get "/v1/chats/#{chat.id}", user, { include_summaries: true }
    expect(json_response["summaries"].count).to eq 1
    expect(json_response["summaries"].first["id"]).to eq summary.id
  end

  it "lists chat messages by chat" do
    message!({chat: another_chat})
    messages = [message!, message!({tweeted_at: Time.now - 600})]
    api_get "/v1/chats/#{chat.id}/messages", user

    expect_response_code_of(200)
    expect(json_response["chat_messages"]).to match_ids_of messages
  end

  it "retrieves chat handles" do
    %w(joe kim steve kim).each { |handle| message!(twitter_handle: handle) }

    api_get "/v1/chats/#{chat.id}", user
    expect(json_response["handles"]).to match_array %w(joe kim steve)
  end

  it "can return messages prior to a specific message" do
    messages = [message!, message!(tweeted_at: Time.now - 600)]
    params = { before_chat_message_id: messages.first.id }

    api_get "/v1/chats/#{chat.id}/messages", user, params

    expect_response_code_of(200)
    expect(json_response["chat_messages"]).to match_ids_of [messages.last]
  end

  it "lists all chat messages" do
    messages = [message!(chat: chat), message!(chat: another_chat)]
    get "/v1/chats/messages"

    expect_response_code_of(200)
    expect(json_response["chat_messages"]).to match_ids_of messages
  end

  it "lists chat messages in reverse chronological order" do
    message = 3.times.map do
      Timecop.travel 1.minute
      message!(chat: chat)
    end

    get "/v1/chats/messages"

    returned_ids = json_response["chat_messages"].map{|c| c["id"]}
    expect(returned_ids).to eq message.map(&:id)
  end

  it "lists all chat messages prior to a specific message" do
    messages = [
      message!(chat: chat),
      message!(chat: another_chat, tweeted_at: Time.now - 600) ]
    params = { before_chat_message_id: messages.first.id }

    api_get "/v1/chats/messages", user, params

    expect_response_code_of(200)
    expect(json_response["chat_messages"]).to match_ids_of [messages.last]
  end

  it "creates a chat message" do
    expect { api_post "/v1/chats/#{chat.id}/messages", user, text: "hi!" }
      .to change(ChatMessage, :count).from(0).to(1)

    chat_message = ChatMessage.first
    expected_response =
      ChatMessageSerializer.serialize(chat_message)

    expect_response_code_of(201)
    expect(chat_message.sent_at).not_to eq(nil)
    expect(json_response.deep_symbolize_keys).to eq(expected_response)
  end

  context "with a moderated chat" do
    let(:user) { User.find_by(twitter_username: chat.moderators.keys.first) }
    let(:user2) { create :user, :twitter}
    let(:chat) { create :chat, :with_moderators }
    let(:message) { message! }

    it "flags a chatmessage as spam" do
      api_put "/v1/chats/#{chat.id}/messages/#{message.tweet_id}", user, spam: true

      expect_response_code_of(204)
      expect(message.reload.flagged_by_id).to eq user.id
    end

    it "dissallows another user from flagging a chat message" do
      api_put "/v1/chats/#{chat.id}/messages/#{message.tweet_id}", user2, spam: true

      expect_response_code_of(403)
    end

    it "filters flagged chats" do
      unflagged = message!
      api_put "/v1/chats/#{chat.id}/messages/#{message.tweet_id}", user, spam: true
      api_get "/v1/chats/#{chat.id}/messages", user

      expect(json_response["chat_messages"]).to match_ids_of [unflagged]
    end

    it "flags a spammer" do
      api_put "/v1/chats/#{chat.id}", user, spammer_id: user2.twitter_id

      expect_response_code_of(200)
      expect(chat.reload.spammers).to eq [user2.twitter_id]
    end

    it "updates the description" do
      api_put "/v1/chats/#{chat.id}", user, description: "This is a thing"

      expect_response_code_of(200)
      expect(chat.reload.description).to eq "This is a thing"
    end

    context "twitter user search" do
      before do
        allow(TwitterService).to receive(:user_hash)
          .and_return({ "joe" => { "id" => "234",
            "twitter_profile_image_url" => "https://twitter.com/joe/profile_image?size=bigger" }})
      end

      it "updates the moderators list" do
        api_put "/v1/chats/#{chat.id}", user, moderator_list: "@joe"

        expect_response_code_of(200)
        expect(chat.reload.moderators).to eq (
          {"joe" => { "id" => "234",
            "twitter_profile_image_url" => "https://twitter.com/joe/profile_image?size=bigger"
            }
          })
      end

      it "doesn't allow you to remove yourself as a moderator" do
        expect(TwitterService).to receive(:user_hash).with("@joe, @#{user.twitter_username}")
        api_put "/v1/chats/#{chat.id}", user, moderator_list: "@joe"
      end

    end

    it "marks a spammers chat messages" do
      chat_message = create :chat_message, chat: chat, twitter_id: user2.twitter_id

      api_put "/v1/chats/#{chat.id}", user, spammer_id: user2.twitter_id

      expect(chat_message.reload.flagged_by_id).to eq user.id
    end
  end

  describe "schedule updates" do
    let(:user) { create :user, :twitter}
    let(:chat) { create :chat, :with_schedule, moderators: { "person": { "id": user.twitter_id } }  }

    def update(schedule_params={})
      api_put "/v1/chats/#{chat.id}", user, default_schedule_params.merge(schedule_params)
    end

    include_examples "schedule examples"

    it "does not clear the schedule if unspecified" do
      api_put "/v1/chats/#{chat.id}", user, description: "bloop"
      expect(chat.reload.schedule).to_not be_nil
    end
  end

  describe "search" do
    before(:each) do
      Chat.create_index!
      chat && another_chat
      Chat.refresh_index!
    end

    it "returns visible chats by name (ngram)" do
      get "/v1/chats/search", q: chat.name.slice(1..3)

      chats = json_response.deep_symbolize_keys.fetch(:chats)
      expect(chats.size).to eq(1)
      expect(chats.first[:id]).to eq(chat.id)
    end

    it "returns visible chats by description (fulltext)" do
      get "/v1/chats/search", q: "seuss"

      chats = json_response.deep_symbolize_keys.fetch(:chats)
      expect(chats.size).to eq(1)
      expect(chats.first[:id]).to eq(chat.id)
    end
  end
end

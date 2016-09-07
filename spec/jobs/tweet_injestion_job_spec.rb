require "rails_helper"

RSpec.describe TweetInjestionJob, type: :job do
  let(:chat) { create :chat }
  let(:chats) {{ chat.name => chat }}
  let(:chat_names) { chats.keys.join(" ") }
  let(:chat_message) { create :chat_message, chat: chat }
  let(:twitter_id) { rand(10000..9999999999).to_s }
  let(:url) { Faker::Internet.url }
  let(:quoted_status_id) { 666720143934754821 }
  let(:retweeted_status_id) { 723478146285713412 }
  let(:quoted_status_url) {
    "https://twitter.com/johnccarver/status/#{quoted_status_id}"
  }
  let(:quoted_status_embedded_url) { Faker::Internet.url }
  let(:tweet) { tweet_hash }
  let(:quote_tweet) { quote_tweet_hash }
  let(:retweet) { retweet_hash }

  def create_tweet(options = {})
    tweet_hash(options)
  end

  def tweet_hash(options = {})
    {
      "id" => rand(100000000000000000..999999999999999999).to_s,
      "text" => "#{Faker::Lorem.sentence} #{url} #{chat_names}",
      "user" => {
        "screen_name" => Faker::Internet.user_name,
        "id" => twitter_id,
        "profile_image_url_https" => Faker::Internet.url
      },
      "entities" => {
        "hashtags" => chats.keys.map{ |name| { "text" => name.sub(/\A#/, '') } },
        "urls" => [
          { "expanded_url" => url },
          { "expanded_url" => quoted_status_url }
        ],
        "media" => [
          { "id" => 1, "type" => "photo", "media_url_https" => "https://img.com/img1.jpg", "expanded_url" => "https://twitter.com/123" },
          { "id" => 2, "type" => "photo", "media_url_https" => "https://img.com/img2.jpg", "expanded_url" => "https://twitter.com/456" }
        ],
      },
      "created_at" => "Mon Nov 09 19:49:57 +0000 2015"
    }.merge(options)
  end
  let(:quote_tweet_hash) do
    tweet_hash.merge({
      "quoted_status" => {
        "id" => quoted_status_id,
        "text" => Faker::Lorem.sentence,
        "entities" => {
          "urls" => [ { "expanded_url" => quoted_status_embedded_url } ]
        }
      },
      "quoted_status_id" => quoted_status_id })
  end
  let(:retweet_hash) do
    tweet_hash.merge({
      "retweeted_status" => {
        "id" => retweeted_status_id,
        "text" => tweet_hash["text"],
        "entities" => {
          "urls" => [ { "expanded_url" => quoted_status_embedded_url } ]
        }
      }})
  end

  let(:bad_tweet) { bad_tweet_hash }
  let(:bad_hashtag) { "#{chat.name}ShouldNotMatch" }
  let(:bad_tweet_hash) do
    hash = tweet_hash.dup
    hash["text"] = "This should not match a chat #{bad_hashtag}"
    hash["entities"] = hash["entities"].dup.merge(
      "hashtags" => [ { "text" => bad_hashtag.sub(/\A#/, '') } ]
    )
    hash
  end

  before(:each) do
    allow(RealtimeService).to receive(:publish)
    allow(ChatLinkJob).to receive(:perform_async)
  end

  it "creates a chat message" do
    expect(RealtimeService).to receive(:publish).once
    expect {
      subject.perform(tweet)
    }.to change(ChatMessage, :count).from(0).to(1)
  end

  it "does not send realtime messaging" do
    expect(RealtimeService).to_not receive(:publish)
    expect {
      subject.perform(tweet, false)
    }.to change(ChatMessage, :count).from(0).to(1)
  end

  it "flags a spammers message and does not publish" do
    chat.add_spammer(tweet["user"]["id"])
    expect(RealtimeService).to_not receive(:publish)

    subject.perform(tweet)

    expect(ChatMessage.first.flagged_by_id).to eq Appo::Constants::NIL_UUID
  end

  it "flags global spammers and does not publish" do
    TwitterSpammer.add(tweet["user"]["id"])
    expect(RealtimeService).to_not receive(:publish)

    subject.perform(tweet)

    expect(ChatMessage.first.flagged_by_id).to eq Appo::Constants::NIL_UUID
  end

<<<<<<< HEAD
  it "associates a known greenprint user with a chat message" do
=======
  it "associates a known participate user with a chat message" do
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    user = create :user, twitter_id: twitter_id
    subject.perform(tweet)

    expect(ChatMessage.last.user).to eq user
  end

  it "creates a chat_message for a retweet" do
    expect {
      subject.perform(retweet)
    }.to change(ChatMessage, :count).from(0).to(2)
  end

  it "finds exising chat messages" do
    create :chat_message, tweet_id: tweet["id"]
    expect {
      subject.perform(tweet)
    }.not_to change(ChatMessage, :count)
  end

  it "creates a chat message for each matching chat" do
    chats["#2ndchat"] = create :chat, name: "#2ndChat"
    expect {
      subject.perform(tweet)
    }.to change(ChatMessage, :count).from(0).to(2)
  end

  it "does not create a chat message for non-matching chats" do
    create :chat
    expect {
      subject.perform(tweet)
    }.to change(ChatMessage, :count).from(0).to(1)
  end

  it "creates and associates a quoted tweet" do
    create :chat
    expect {
      subject.perform(quote_tweet)
    }.to change(ChatMessage, :count).from(0).to(2)

    message = ChatMessage.where(chat: chat).first
    expect(message.retweeted_chat_message.tweet_id).to eq quoted_status_id.to_s

    expect(ChatMessage.where(chat: chat).first
      .retweeted_chat_message.tweet_id).to eq quoted_status_id.to_s
  end

  it "creates and associates a retweet" do
    create :chat
    expect {
      subject.perform(retweet)
    }.to change(ChatMessage, :count).from(0).to(2)

    message = ChatMessage.where(chat: chat).first
    expect(message.retweeted_chat_message.tweet_id).to eq retweeted_status_id.to_s
    expect(message.retweet).to eq true
  end

  it "only matches fully-matching chats" do
    expect {
      subject.perform(bad_tweet)
    }.not_to change(ChatMessage, :count)
  end

  it "extracts urls from tweets" do
    expect(ChatLinkJob).to receive(:perform_async).with(url, tweet["id"], true)
    subject.perform(tweet)
  end

  it "excludes urls that refer to a quoted tweet" do
    expect(quote_tweet["quoted_status_id"]).to eq(quoted_status_id)

    expect(quote_tweet["entities"]["urls"].map{ |u| u["expanded_url"].to_s })
      .to include(quoted_status_url)

    expect(ChatLinkJob)
      .not_to receive(:perform_async)
      .with(quoted_status_url, quote_tweet["id"])

    subject.perform(quote_tweet)
  end

  it "associates urls embedded in a quoted tweet with original tweet" do
    expect(ChatLinkJob).to receive(:perform_async).with(url, quote_tweet["id"], true)
    expect(ChatLinkJob)
      .to receive(:perform_async)
      .with(quoted_status_embedded_url, quote_tweet["id"], true)
    subject.perform(quote_tweet)
  end

  it "unescapes html encoded characters" do
    tweet = create_tweet("text" => "This &amp; this are &lt;dope&gt;")
    subject.perform(tweet)

    expect(ChatMessage.last.text).to eq "This & this are <dope>"
  end

  it "extracts media from tweets" do
    subject.perform(tweet)
    expect(ChatMessage.last.media).to match [
      { "image_url" => "https://img.com/img1.jpg", "url" => "https://twitter.com/123" },
      { "image_url" => "https://img.com/img2.jpg", "url" => "https://twitter.com/456" }
    ]
  end
end

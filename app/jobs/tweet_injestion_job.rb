class TweetInjestionJob
  include Sidekiq::Worker
  sidekiq_options queue: :tweets

  def perform(data, realtime = true)
    @realtime = realtime

    process_tweet(data, Chat.current_hash)
  end

  private

  def process_tweet(tweet, chats)
    return if ChatMessage.where(tweet_id: tweet["id"]).exists?

    params = extract_message_params(tweet)

    messages = applicable_chats(tweet, chats).map do |chat|
      process_message(params, chat)
    end

    process_links(tweet) if messages.compact.present?
  end

  private

  def process_message(params, chat)
    chat_params = params.dup
    chat_params["chat_id"] = chat.id

    if spam = chat.is_spammer?(params[:twitter_id])
      chat_params[:flagged_by_id] = Appo::Constants::NIL_UUID
    end

    ChatMessage.create!(chat_params).tap do |message|
      publish_tweet(chat, message) unless spam
      QuestionAndAnswer.process(chat, message)
    end
  end

  def applicable_chats(tweet, chats)
    hashtags = tweet["entities"]["hashtags"].map{ |hashtag| "##{hashtag["text"].downcase}" }
    chats.values_at(*hashtags).compact
  end

  def create_retweeted_message(retweet)
    return if retweet.nil?

    ChatMessage.find_by(tweet_id: retweet["id"]) ||
      ChatMessage.create!(extract_message_params(retweet))
  end

  def extract_message_params(tweet)
    params = {
      tweet_id: tweet["id"].to_s,
      text: CGI::unescapeHTML(tweet["text"]),
      media: process_media(tweet),
      tweeted_at: tweet["created_at"],
      retweet: tweet["retweeted_status"].present?,
      received_at: Time.now
    }

    if tweet["user"].present?
      params.merge!(process_user(tweet["user"]))
    end

    if tweet["retweeted_status"].present?
      params[:retweet] = true
      params[:retweeted_chat_message_id] =
        create_retweeted_message(tweet["retweeted_status"]).try("id")
    end

    if tweet["quoted_status"].present?
      params[:retweeted_chat_message_id] =
        create_retweeted_message(tweet["quoted_status"]).try("id")
    end

    params
  end

  def process_user(user_hash)
    { twitter_handle: user_hash["screen_name"],
      twitter_id: user_hash["id"].to_s,
      twitter_profile_image_url: user_hash["profile_image_url_https"].to_s,
      user_id: User.find_by(twitter_id: user_hash["id"]).try("id") }
  end

  def publish_tweet(chat, message)
    return if !@realtime || ENV["TEST_MODE"]

    if message.retweet
      event = :retweet
      payload = { retweeted: ChatMessageSerializer.serialize(message) }
    else
      event = :chat_message
      payload = ChatMessageSerializer.serialize(message)
    end

    RealtimeService.publish(chat, event, false, payload, async: false)
  end

  def process_links(tweet)
    resource_urls(tweet).each do |url|
      begin
        ChatLinkJob.perform_async(url, tweet["id"], @realtime) unless ENV["TEST_MODE"]
      rescue
        ::TwitterStreamer.log "[Tweet Processor] ChatLinkJob exception: #{$!}"
      end
    end
  end

  def resource_urls(tweet)
    urls = tweet["entities"]["urls"].map { |u| u["expanded_url"].to_s }
    urls = exclude_urls_to_quoted_tweets(urls, tweet["quoted_status_id"])
    urls = include_urls_in_quoted_tweets(urls, tweet["quoted_status"])

    urls
  end

  def include_urls_in_quoted_tweets(urls, quoted_tweet)
    return urls unless quoted_tweet
    (urls + resource_urls(quoted_tweet)).uniq
  end

  def exclude_urls_to_quoted_tweets(urls, quoted_status_id)
    return urls unless quoted_status_id

    tweet_url_regex = %r{
      \Ahttps?://(?:[^/]+\.)*twitter.com/[^/]+/status/
      #{quoted_status_id}
      (\?|\z)
    }xi

    urls.reject { |u| u =~ tweet_url_regex }
  end

  def process_media(tweet)
    if tweet["entities"]["media"].present?
      tweet["entities"]["media"].map do |m|
        { image_url: m["media_url_https"].to_s, url: m["expanded_url"].to_s }
      end
    end
  end
end

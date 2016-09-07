class ChatMessageSerializer < BaseSerializer
  attributes :id, :user, :chat_id, :twitter_handle, :tweet_id, :twitter_id,
             :text, :media, :twitter_profile_image_url, :tweeted_at, :quoted_chat_message

  has_many :resources

  def quoted_chat_message
    QuotedChatMessageSerializer.serialize(object.retweeted_chat_message)
  end

  def resources
    ChatResourceSerializer.list(object.chat_resources)
  end

  def twitter_profile_image_url
    TwitterService.profile_img(object.twitter_handle)
  end
end

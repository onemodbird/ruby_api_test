class ChatMessage < ActiveRecord::Base
  belongs_to :chat
  belongs_to :user

  belongs_to :retweeted_chat_message, class_name: "ChatMessage", foreign_key: :retweeted_chat_message_id
  has_many :chat_resources
  has_many :resources, through: :chat_resources

  validates_presence_of :text, presence: true

  scope :chronological, -> { order(tweeted_at: :asc) }
  scope :ordered, -> { order(tweeted_at: :desc) }
  scope :unflagged, -> { where(flagged_by_id: nil) }
  scope :before, -> (timestamp) do
    where("tweeted_at < ?", timestamp) if timestamp
  end
  scope :retweet, -> (retweet) { where(retweet: retweet) }
  scope :after, -> (timestamp) do
    where("tweeted_at > ?", timestamp) if timestamp
  end
  scope :in_last_month, -> { where("tweeted_at > ?", Time.now - 1.month) }
  scope :unique_handle_count, -> { distinct.count(:twitter_handle) }

  def self.latest(limit, before_chat_message_id = nil)
    messages = ordered.unflagged.retweet(false).includes(:retweeted_chat_message, :resources).limit(limit)

    if before_chat_message_id.present?
      messages = messages.before find_by_id(before_chat_message_id).tweeted_at
    end

    messages
  end

  def flag(user, spam = true)
    update_attribute(:flagged_by_id, spam ? user.id : nil)
    RealtimeService.publish(chat, "chat_message_delete", false, { ids: [id] })
  end
end

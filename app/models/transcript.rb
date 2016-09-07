class Transcript < ActiveRecord::Base
  include Linkable

  MAX_TIME_PERIOD = 72.hours

  belongs_to :chat
  belongs_to :user
  belongs_to :collection

  validates :begin_at, :end_at, :user_id, :chat_id, presence: true
  validate :max_time_period
  before_save do
    self.name ||= chat.name
  end

  def max_time_period
    if end_at - begin_at > MAX_TIME_PERIOD
      errors.add(:end_at, "must be within #{MAX_TIME_PERIOD/1.hour} hours")
    end
  end

  def qa_sessions
    QASession.for_transcript(self)
  end

  def chat_messages(retweets = false)
    messages = chat.chat_messages.before(end_at).after(begin_at)
    messages = messages.retweet(retweets) unless retweets.nil?

    if omitted_message_ids.present?
      messages = messages.where("chat_messages.id not in (?)", omitted_message_ids)
    end

    messages
  end

  def ordered_messages
    chat_messages.chronological
      .includes(:user, :resources, { retweeted_chat_message: [:user, :resources] })
  end

  def generate_collection
    return if collection_id.present?

    # Remove duplicates and format for create_with_resources
    resources = ChatResource
      .joins("inner join chat_messages on chat_resources.chat_message_id = chat_messages.id")
      .where(chat_id: chat_id)
      .where("chat_messages.tweeted_at >= ?", begin_at)
      .where("chat_messages.tweeted_at <= ?", end_at)
      .order("chat_messages.tweeted_at desc")
      .select(:resource_id)
      .pluck(:resource_id)
      .uniq.map{ |id| { id: id } }

    transaction do
      self.collection = Collection.create_with_resources!(user_id, {
        name: "#{chat.name} Curated Collection",
        description: "Curated resources from a #{chat.name} chat",
        resources: resources
        })

      self.save
    end

    self.collection
  end

  def begin_at_display
    begin_at.strftime("%m/%d/%Y")
  end

  def omit_message_id(chat_message_id)
    omitted_message_ids << chat_message_id
    save!
  end

  def clear_omitted_messages!
    omitted_message_ids.clear
    save!
  end

  def analytics
    {
      participant_count: chat_messages(nil).unique_handle_count,
<<<<<<< HEAD
      greenprint_user_count: chat_messages(nil).distinct.count(:user_id),
=======
      participate_user_count: chat_messages(nil).distinct.count(:user_id),
>>>>>>> parent of 0bd3464... customize to greenprintmedia
      message_count: chat_messages.count,
      retweet_count: chat_messages(true).count,
      question_count: QASession.questions_for_transcript(self).count,
      answer_count: QASession.answers_for_transcript(self).count,
    }.tap do |data|
      data[:resource_count] = collection.resources.count if collection_id.present?
    end
  end
end

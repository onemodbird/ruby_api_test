class Chat < ActiveRecord::Base
  include Subscribable
  include Schedulable
  include Searchable

  has_many :chat_messages

  after_create { notify_administrator }
  after_commit -> { update_tweet_streamer }
  after_commit -> { backfill_chat_history }, on: :create
  after_commit -> { self.class.current_hash(true) }

  validates :name, presence: true

  INDEX_COUNTER = 3
  settings ::Searchable::SETTINGS do
    mappings dynamic: false do
      indexes :name,
        type: "string",
        fields: {
          autocomplete: {
            type: "string",
            analyzer: "autocomplete",
            search_analyzer: "standard"
          },
          sort: {
            type: "string",
            analyzer: "lowercase_keyword"
          }
        }
      indexes :description, type: "string"
      indexes :archived, type: "boolean"
    end
  end

  def as_indexed_json options={}
    attributes.slice(*%w(id name description))
  end

  def self.basic_search(query)
    search(
      sort: [ { "name.sort" => "asc" } ],
      size: 10,
      query: {
          bool: {
            should: [
              {
                match: {
                  "name.autocomplete" => {
                    query: query,
                    minimum_should_match: "100%"
                  }
                }
              },
              {
                match: {
                  description: { query: query }
                }
              }
            ]
          }
      }
    )
    .records
  end

  def self.current
    where(archived_at: nil).order(name: :asc)
  end

  def self.archived
    where.not(archived_at: nil).order(name: :asc)
  end

  def self.current_hash(update = false)
    get_current = Proc.new do
      Chat.current.inject({}) do |hash, chat|
        name = chat.name.downcase.sub(/\A#/, "#")
        hash[name] = chat
        hash
      end
    end

    if update
      hash = get_current.call
      Rails.cache.write(:current_chats, hash)

      hash
    else
      Rails.cache.fetch(:current_chats) { get_current.call }
    end
  end

  def self.normalize_hashtag(name)
    "#" + name.strip.gsub(/^#+/, "").gsub(/@/, "")
  end

  def notify_administrator
    msg = "Chat #{name} created."
    SystemMailer.administrator_notification(msg).deliver_later
  end

  def moderator_list
    moderators.keys.map{ |handle| "@#{handle}" }.join(", ")
  end

  def moderator_list=(value)
    if value.blank?
      self.moderators = {}
    else
      self.moderators = TwitterService.user_hash(value)
    end
  end

  def is_moderator?(user)
    moderators.detect { |_, data| data["id"].to_s == user.twitter_id } ? true : false
  end

  def is_spammer?(twitter_id)
    (spammers | TwitterSpammer.all).include?(twitter_id.to_s)
  end

  def add_spammer(twitter_id, flagged_by_id = Appo::Constants::NIL_UUID)
    return if spammers && spammers.include?(twitter_id.to_s)

    spammers << twitter_id.to_s
    save!

    # Send a realtime message with the twitter handle for removal
    if chat_message = ChatMessage.where(twitter_id: twitter_id).order(tweeted_at: :desc).first
      RealtimeService.publish(self,
        "chat_user_remove", false, twitter_handle: chat_message.twitter_handle)
    end

    flag_messages(twitter_id, flagged_by_id)
  end

  def recent_twitter_handles
    query = <<-SQL
      SELECT DISTINCT twitter_handle
      FROM (SELECT twitter_handle
        FROM chat_messages
        WHERE chat_id = '#{id}'
        ORDER BY tweeted_at DESC
        LIMIT 1000) recents
    SQL

    ActiveRecord::Base.connection.execute(query).column_values(0)
  end

  def url
    [Secrets.site_url, "chats", name.downcase[1..-1]].join("/")
  end

  def current_qa_session
    current_qa_session_id ? QASession.find(current_qa_session_id) : nil
  end

  def summaries
    ChatOccurrenceSummary.joins(:schedule_occurrence)
      .where(schedule_occurrences: { schedulable_id: id })
      .order("schedule_occurrences.start_time DESC")
  end

  def archive!
    transaction do
      ScheduledPromo.for_occurrences(future_occurrences).update_all(canceled_at: Time.now)
      future_occurrences.destroy_all
      update_attributes(
        promos_enabled: false,
        archived_at: Time.now)
    end
  end

  private

  def flag_messages(twitter_id, flagged_by_id)
    flagged = ChatMessage.where(twitter_id: twitter_id.to_s, chat: self)
    flagged.update_all({ flagged_by_id: flagged_by_id })

    RealtimeService.publish(self, "chat_message_delete", false, ids: flagged.pluck(:id) )
  end

  def update_tweet_streamer
    return unless Secrets.tweet_streamer == "gnip"
    return unless (previous_changes.keys & ["name", "archived_at"]).present?
    SyncGnipStreamRulesJob.perform_async
  end

  def backfill_chat_history
    return unless Secrets.tweet_streamer == "gnip"
    BackfillChatHistoryJob.perform_async(id)
  end
end

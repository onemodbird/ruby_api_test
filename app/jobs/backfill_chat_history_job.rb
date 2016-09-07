class BackfillChatHistoryJob
  include Sidekiq::Worker
  sidekiq_options queue: "import"

  MAX_TWEET_COUNT = 10_000

  def perform(chat_id)
    @chat = Chat.find(chat_id)
    populate_history
  end

  private
  attr_reader :chat

  def populate_history
    tweet_count = 0
    cursor = nil

    loop do
      data = GnipService.history.get(chat.name, cursor)
      tweet_count += data.fetch("results").size

      data.fetch("results").each do |tweet|
        Sidekiq::Client.enqueue_to(:import, TweetInjestionJob, tweet, false)
      end

      break if tweet_count >= MAX_TWEET_COUNT
      break unless data.key?("next")
      cursor = data.fetch("next")
    end
  end

end

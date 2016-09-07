class ChatAnalyticsJob
  include Sidekiq::Worker

  def perform
    Chat.find_each do |chat|
      chat.update_attribute :analytics,
        monthly_messages: chat.chat_messages.retweet(false).in_last_month.count,
        monthly_retweets: chat.chat_messages.retweet(true).in_last_month.count,
        monthly_participants: chat.chat_messages.in_last_month.unique_handle_count
    end
  end
end

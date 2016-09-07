class ChangeQuotedChatMessageIdToRetweetedChatMessageId < ActiveRecord::Migration
  def change
    rename_column :chat_messages, :quoted_chat_message_id, :retweeted_chat_message_id
    add_column :chat_messages, :retweet, :boolean, default: false
  end
end

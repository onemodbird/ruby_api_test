class AddIndexToChatMessagesTweetedAt < ActiveRecord::Migration
  def change
    remove_index :chat_messages, column: [:chat_id, :tweeted_at]
    add_index :chat_messages, :chat_id
    add_index :chat_messages, :tweeted_at
  end
end

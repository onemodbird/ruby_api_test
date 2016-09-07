class AddCompositeIndexToChatMessages < ActiveRecord::Migration
  def change
    add_index :chat_messages, [:chat_id, :tweeted_at], order: { tweeted_at: :desc }
    remove_index :chat_messages, column: :tweeted_at
  end
end

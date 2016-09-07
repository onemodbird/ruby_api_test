class AddTweetToChatMessage < ActiveRecord::Migration
  def change
    add_column :chat_messages, :tweet, :jsonb, null: false, default: {}
  end
end

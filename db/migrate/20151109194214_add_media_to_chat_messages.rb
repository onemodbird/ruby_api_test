class AddMediaToChatMessages < ActiveRecord::Migration
  def change
    add_column :chat_messages, :media, :jsonb
  end
end

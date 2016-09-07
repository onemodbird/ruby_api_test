class AddQuotedChatMessageIdToChatMessage < ActiveRecord::Migration
  def up
    add_column :chat_messages, :quoted_chat_message_id, :string
    change_column :chat_messages, :chat_id, :uuid, null: true
  end

  def down
    change_column :chat_messages, :chat_id, :uuid, null: false
    remove_column :chat_messages, :quoted_chat_message_id
  end
end

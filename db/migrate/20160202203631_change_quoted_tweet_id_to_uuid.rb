class ChangeQuotedTweetIdToUuid < ActiveRecord::Migration
  def change
    change_column :chat_messages, :quoted_chat_message_id, 'uuid using "quoted_chat_message_id"::UUID'
  end
end


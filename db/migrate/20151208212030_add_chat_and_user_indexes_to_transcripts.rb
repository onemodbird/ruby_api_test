class AddChatAndUserIndexesToTranscripts < ActiveRecord::Migration
  def change
    add_index :transcripts, :chat_id
    add_index :transcripts, :user_id
  end
end

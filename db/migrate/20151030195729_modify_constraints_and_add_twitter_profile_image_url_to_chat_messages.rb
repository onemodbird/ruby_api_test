class ModifyConstraintsAndAddTwitterProfileImageUrlToChatMessages < ActiveRecord::Migration
  def change
    remove_column :chat_messages, :incoming, :boolean, null: false
    add_column :chat_messages, :twitter_profile_image_url, :string
    rename_column :chat_messages, :twitter_user_id, :tweet_id
    change_column_null :chat_messages, :twitter_handle, true
    change_column_null :chat_messages, :sent_at, true
    change_column_null :chat_messages, :received_at, true

    remove_index :chat_messages, column: :twitter_id
    add_index :chat_messages, :tweet_id
  end
end

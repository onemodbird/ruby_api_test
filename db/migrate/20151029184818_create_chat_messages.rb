class CreateChatMessages < ActiveRecord::Migration
  def change
    create_table :chat_messages, id: :uuid do |t|
      t.uuid      :user_id
      t.boolean   :incoming, null: false
      t.uuid      :chat_id, null: false
      t.string    :twitter_handle, null: false
      t.string    :twitter_user_id
      t.string    :twitter_id, unique: true, null: true
      t.string    :text, null: false
      t.timestamp :sent_at, null: false
      t.timestamp :tweeted_at
      t.timestamp :received_at, null: false
    end

    add_index :chat_messages, [:chat_id, :tweeted_at]
    add_index :chat_messages, :twitter_id
  end
end

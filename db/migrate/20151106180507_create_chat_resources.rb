class CreateChatResources < ActiveRecord::Migration
  def change
    create_table :chat_resources, id: :uuid do |t|
      t.uuid :chat_id, null: false
      t.uuid :chat_message_id, null: false
      t.uuid :resource_id, null: false

      t.timestamps null: false
    end

    add_index :chat_resources, :chat_id
    add_index :chat_resources, :chat_message_id
  end
end

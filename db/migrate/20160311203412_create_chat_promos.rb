class CreateChatPromos < ActiveRecord::Migration
  def change
    create_table :chat_promos, id: :uuid do |t|
      t.string :key
      t.string :kind
      t.integer :time_offset, default: 0
      t.string :text
      t.uuid :image_id
      t.timestamps null: false
    end

    create_table :chat_occurrence_promos, id: :uuid do |t|
      t.string :key
      t.uuid :schedule_occurrence_id
      t.jsonb :scheduled_message_ids, default: []
      t.boolean :disabled, default: false
    end

    add_index :chat_occurrence_promos, :schedule_occurrence_id

    add_column :chats, :promos_enabled, :boolean, default: false
  end
end

class MoveChatPromosToSti < ActiveRecord::Migration
  def up
    drop_table :chat_occurrence_promos
    add_column :scheduled_messages, :chat_promo_id, :uuid
    add_column :scheduled_messages, :schedule_occurrence_id, :uuid
  end

  def down
    create_table :chat_occurrence_promos, id: :uuid do |t|
      t.string :key
      t.uuid :schedule_occurrence_id
      t.jsonb :scheduled_message_ids, default: []
      t.boolean :disabled, default: false
    end

    remove_column :scheduled_messages, :chat_promo_id
    remove_column :scheduled_messages, :schedule_occurrence_id
  end
end

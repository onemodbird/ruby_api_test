class AddFlaggedByIdToChatMessage < ActiveRecord::Migration
  def change
    add_column :chat_messages, :flagged_by_id, :uuid
  end
end

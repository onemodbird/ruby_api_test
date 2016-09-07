class AddDisabledFlagToChatPromos < ActiveRecord::Migration
  def change
    add_column :chat_promos, :disabled_at, :timestamp
  end
end

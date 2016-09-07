class AddAcknowledgedNotificationsIndex < ActiveRecord::Migration
  def change
    add_index :notifications, [:user_id, :acknowledged]
  end
end

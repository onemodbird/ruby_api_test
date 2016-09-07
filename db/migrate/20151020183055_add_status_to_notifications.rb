class AddStatusToNotifications < ActiveRecord::Migration
  def change
    add_column :notifications, :email, :boolean, default: false
    add_column :notifications, :realtime, :boolean, default: false
  end
end

class AddParamsIndexToNotifications < ActiveRecord::Migration
  def change
    add_index :notifications, :params, using: :gin
  end
end

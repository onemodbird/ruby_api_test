class RemoveNotificationForeignKey < ActiveRecord::Migration
  def up
    remove_foreign_key :notifications, :users
  end

  def down
    add_foreign_key :notifications, :users
  end
end

class AddArchivedAtFlagToChats < ActiveRecord::Migration
  def change
    add_column :chats, :archived_at, :datetime
    remove_column :chats, :last_subscribed_at, :datetime

    add_index :chats, :archived_at
  end
end

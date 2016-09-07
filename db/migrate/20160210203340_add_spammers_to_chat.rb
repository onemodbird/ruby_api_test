class AddSpammersToChat < ActiveRecord::Migration
  def change
    add_column :chats, :spammers, :jsonb, default: []
  end
end

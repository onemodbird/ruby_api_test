class AddFeaturedFlagToChats < ActiveRecord::Migration
  def change
    add_column :chats, :featured, :boolean, default: false
  end
end

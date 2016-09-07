class AddDescriptionToChats < ActiveRecord::Migration
  def change
    add_column :chats, :description, :text
  end
end

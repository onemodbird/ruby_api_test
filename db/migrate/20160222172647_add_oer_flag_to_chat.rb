class AddOerFlagToChat < ActiveRecord::Migration
  def change
    add_column :chats, :oer, :boolean, default: false
  end
end

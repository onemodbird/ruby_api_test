class AddCaseInsensitiveChatNameIndex < ActiveRecord::Migration
  def up
    remove_index :chats, :name
    change_column :chats, :name, :citext, null: false
    add_index :chats, :name, unique: true
  end

  def down
    remove_index :chats, :name
    change_column :chats, :name, :string
    add_index :chats, :name
  end
end

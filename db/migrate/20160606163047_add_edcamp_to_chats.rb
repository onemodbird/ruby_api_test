class AddEdcampToChats < ActiveRecord::Migration
  def change
    add_column :chats, :edcamp, :boolean, default: false
  end
end

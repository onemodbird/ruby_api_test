class CreateChats < ActiveRecord::Migration
  def change
    create_table :chats, id: :uuid do |t|
      t.string :name
      t.datetime :last_subscribed_at
      t.timestamps null: false
    end

    add_index :chats, :name
  end
end

class AddScheduleToChats < ActiveRecord::Migration
  def change
    add_column :chats, :schedule, :jsonb
  end
end

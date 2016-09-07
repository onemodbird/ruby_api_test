class AddAnalyticsHashToChats < ActiveRecord::Migration
  def change
    add_column :chats, :analytics, :jsonb, default: {}
  end
end

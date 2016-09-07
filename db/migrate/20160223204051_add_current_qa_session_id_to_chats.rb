class AddCurrentQaSessionIdToChats < ActiveRecord::Migration
  def change
    add_column :chats, :current_qa_session_id, :uuid
  end
end

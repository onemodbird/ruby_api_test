class AddRedirectCountToChatResources < ActiveRecord::Migration
  def change
    add_column :chat_resources, :redirect_count, :integer, default: 0
  end
end

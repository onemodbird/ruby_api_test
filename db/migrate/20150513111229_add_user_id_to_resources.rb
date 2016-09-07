class AddUserIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :user_id, :uuid
  end
end

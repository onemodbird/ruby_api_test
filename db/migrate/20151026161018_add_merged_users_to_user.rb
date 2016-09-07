class AddMergedUsersToUser < ActiveRecord::Migration
  def change
    add_column :users, :merged_users, :jsonb, default: []
  end
end

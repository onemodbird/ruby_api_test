class AddUserIdToAssignmentDetails < ActiveRecord::Migration
  def change
    add_column :assignment_details, :user_id, :uuid
    add_column :assignment_details, :created_at, :timestamp
    add_column :assignment_details, :updated_at, :timestamp

    add_index :assignment_details, :user_id
  end
end

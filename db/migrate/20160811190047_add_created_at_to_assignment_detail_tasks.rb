class AddCreatedAtToAssignmentDetailTasks < ActiveRecord::Migration
  def change
    add_column :assignment_detail_tasks, :created_at, :timestamp
  end
end

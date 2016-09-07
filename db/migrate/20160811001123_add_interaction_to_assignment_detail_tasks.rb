class AddInteractionToAssignmentDetailTasks < ActiveRecord::Migration
  def change
    add_column :assignment_detail_tasks, :interaction, :string
    rename_column :assignment_detail_tasks, :action, :kind
  end
end

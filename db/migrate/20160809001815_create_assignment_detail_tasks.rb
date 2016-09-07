class CreateAssignmentDetailTasks < ActiveRecord::Migration
  def change
    create_table :assignment_detail_tasks, id: :uuid do |t|
      t.uuid :assignment_detail_id, null: false
      t.uuid :user_id
      t.string :action, null: false
      t.uuid :resource_id
      t.json :data
    end

    add_index :assignment_detail_tasks, :assignment_detail_id
  end
end

class CreateAssignmentDetails < ActiveRecord::Migration
  def change
    create_table :assignment_details, id: :uuid do |t|
      t.string :state
      t.uuid :assignment_id, null: false
      t.uuid :resource_id, null: false
    end

    add_index :assignment_details, :assignment_id
  end
end

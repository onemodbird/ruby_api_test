class MakeAssignmentsPolymorphic < ActiveRecord::Migration
  def change
    remove_index :assignments, [:user_id, :resource_id]

    change_column :assignments, :resource_id, :uuid, null: false
    rename_column :assignments, :resource_id, :assignable_id
    add_column :assignments, :assignable_type, :string, null: false, default: "Resource"

    add_index :assignments, [:user_id, :assignable_id]
  end
end

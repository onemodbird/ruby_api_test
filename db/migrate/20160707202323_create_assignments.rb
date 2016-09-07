class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments, id: :uuid do |t|
      t.uuid :resource_id, null: true
      t.uuid :user_id, null: true

      t.datetime :created_at
    end

    add_index :assignments, [:user_id, :resource_id], unique: true
  end
end

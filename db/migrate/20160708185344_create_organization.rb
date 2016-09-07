class CreateOrganization < ActiveRecord::Migration
  def change
    create_table :organizations, id: :uuid do |t|
      t.uuid :parent_id
      t.string :name
      t.string :salesforce_id
      t.string :kind, null: false
      t.timestamps
    end

    create_table :organization_users, id: :uuid do |t|
      t.uuid :organization_id, null: false
      t.uuid :user_id, null: false
      t.string :role, null: false
      t.timestamps
    end

    add_index :organization_users, [:organization_id, :user_id], unique: true
  end
end

class CreateCollaborations < ActiveRecord::Migration
  def change
    create_table :collaborations, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :collaborator_id
      t.uuid :collaboratable_id, null: false
      t.string :collaboratable_type, null: false
      t.string :status
      t.string :email
      t.string :token

      t.timestamps null: false
    end

    add_index :collaborations, :user_id
    add_index :collaborations, :collaborator_id
    add_index :collaborations, [:collaboratable_type, :collaboratable_id], name: 'index_collaborations_on_collaboratable'
    add_index :collaborations, :token
  end
end

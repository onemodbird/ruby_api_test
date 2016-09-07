class AddEmailAndCollaboratableIdIndicesToCollaborations < ActiveRecord::Migration
  def change
    remove_index :collaborations,
      column: [:collaboratable_type, :collaboratable_id],
      name: 'index_collaborations_on_collaboratable'

    add_index :collaborations, :collaboratable_id
    add_index :collaborations, :email
  end
end

class AddUniquenessToCollaborationToken < ActiveRecord::Migration
  def change
    remove_index :collaborations, :token
    add_index :collaborations, :token, :unique => true
  end
end

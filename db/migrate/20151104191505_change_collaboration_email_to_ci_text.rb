class ChangeCollaborationEmailToCiText < ActiveRecord::Migration
  def up
    remove_index :collaborations, :email
    remove_index :users, :email

    change_column :collaborations, :email, :citext
    change_column :users, :email, :citext

    add_index :collaborations, :email
    add_index :users, :email, unique: true
  end

  def down
    remove_index :collaborations, :email
    remove_index :users, :email

    change_column :collaborations, :email, :string
    change_column :users, :email, :string

    add_index :collaborations, :email
    add_index :users, :email, unique: true
  end
end

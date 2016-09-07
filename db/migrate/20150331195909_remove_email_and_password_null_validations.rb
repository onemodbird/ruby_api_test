class RemoveEmailAndPasswordNullValidations < ActiveRecord::Migration
  def change
    change_column :users, :email, :string, :default => "", :null => true
    change_column :users, :encrypted_password, :string, :default => "", :null => true
  end
end

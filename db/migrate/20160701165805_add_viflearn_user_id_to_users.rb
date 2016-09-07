class AddViflearnUserIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :viflearn_user_id, :integer
    add_index :users, :viflearn_user_id, unique: true
  end
end

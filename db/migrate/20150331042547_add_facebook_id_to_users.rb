class AddFacebookIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :string
    add_index "users", ["facebook_id"], name: "index_users_on_facebook_id", unique: true, using: :btree
  end
end

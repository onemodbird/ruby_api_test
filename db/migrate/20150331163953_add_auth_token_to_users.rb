class AddAuthTokenToUsers < ActiveRecord::Migration
  def change
    add_column :users, :auth_token, :string
    add_index "users", ["auth_token"], name: "index_users_on_auth_token", unique: true, using: :btree
  end
end

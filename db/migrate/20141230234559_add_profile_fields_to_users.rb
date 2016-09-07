class AddProfileFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :bio, :text
    add_column :users, :profile_photo_url, :string

    add_column :users, :superuser, :boolean, default: false
    add_column :users, :google_profile_id, :string
    add_column :users, :external_profile_url_1, :string
    add_column :users, :external_profile_url_2, :string
    add_column :users, :visible, :boolean, default: false
    add_column :users, :twitter_username, :string
  end
end

class AddModeratorsToChat < ActiveRecord::Migration
  def change
    add_column :chats, :moderators, :jsonb, default: {}
  end
end
# https://api.twitter.com/1.1/users/show.json?screen_name=twitterdev

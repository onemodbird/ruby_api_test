class AddResourcesUserIndex < ActiveRecord::Migration
  def change
    add_index :resources, :user_id
  end
end

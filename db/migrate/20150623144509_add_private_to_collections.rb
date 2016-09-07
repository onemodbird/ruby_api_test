class AddPrivateToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :private, :boolean, null: false, default: false
  end
end

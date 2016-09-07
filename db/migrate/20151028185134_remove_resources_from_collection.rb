class RemoveResourcesFromCollection < ActiveRecord::Migration
  def change
    remove_column :collections, :resources, :jsonb, default: []
  end
end

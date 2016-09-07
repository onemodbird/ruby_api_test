class RemoveResourcesCountCounterCache < ActiveRecord::Migration
  def change
    remove_column :collections, :resources_count, :integer, default: 0, null: false
  end
end

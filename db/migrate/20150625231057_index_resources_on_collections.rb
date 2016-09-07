class IndexResourcesOnCollections < ActiveRecord::Migration
  def change
    add_index :collections, :resources, using: :gin
  end
end

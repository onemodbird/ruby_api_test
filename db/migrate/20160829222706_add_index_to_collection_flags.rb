class AddIndexToCollectionFlags < ActiveRecord::Migration
  def change
    add_index :collections, :flags, using: :gin
  end
end

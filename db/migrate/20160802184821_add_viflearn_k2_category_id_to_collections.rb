class AddViflearnK2CategoryIdToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :viflearn_k2_category_id, :integer
    add_index :collections, :viflearn_k2_category_id, unique: true
  end
end

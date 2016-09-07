class AddViflearnK2ItemIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :viflearn_k2_item_id, :integer
    add_index :resources, :viflearn_k2_item_id, unique: true
  end
end

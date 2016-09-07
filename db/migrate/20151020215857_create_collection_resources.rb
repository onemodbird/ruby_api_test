class CreateCollectionResources < ActiveRecord::Migration
  def change
    create_table :collection_resources, id: :uuid do |t|
      t.uuid    :user_id, null: false
      t.uuid    :collection_id, null: false
      t.uuid    :resource_id, null: false
      t.integer :position, null: false
      t.text    :description
    end

    add_column :collections, :resources_count, :integer, default: 0, null: false # Counter cache
    add_index :collection_resources, :resource_id
    add_index :collection_resources, :collection_id
  end
end

class CreateFeaturedCollectionGroups < ActiveRecord::Migration
  def change
    create_table :featured_collection_groups, id: :uuid do |t|
      t.uuid :collection_group_id, null: false
      t.integer :position, null: false, default: 0
      t.boolean :visible, null: false, default: false

      t.timestamps null: false
    end
  end
end

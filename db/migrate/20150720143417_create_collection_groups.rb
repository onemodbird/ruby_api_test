class CreateCollectionGroups < ActiveRecord::Migration
  def change
    create_table :collection_groups, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.string :name, null: false
      t.jsonb :collections, null: false, default: []
      t.timestamps null: false
    end

    add_index :collection_groups, :user_id
    add_index :collection_groups, :collections, using: :gin
  end
end

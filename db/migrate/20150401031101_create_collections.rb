class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.string :name, null: false
      t.text :description
      t.jsonb :resources, default: []
      t.jsonb :tags, default: []
      t.jsonb :common_core_tags, default: []

      t.timestamps null: false
    end
    add_index :collections, :tags, using: :gin
  end
end

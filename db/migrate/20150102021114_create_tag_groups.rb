class CreateTagGroups < ActiveRecord::Migration
  def change
    create_table :tag_groups, id: :uuid do |t|
      t.string :name, null: false
      t.jsonb :tags, default: []
      t.jsonb :imported_data, default: {}

      t.timestamps null: false
    end
    add_index :tag_groups, :name, unique: true
    add_index :tag_groups, :tags, using: :gin
  end
end

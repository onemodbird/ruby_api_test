class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources, id: :uuid do |t|
      t.integer :kind, null: false, default: 0
      t.string :url, null: false
      t.string :name
      t.string :image_url
      t.datetime :published_at
      t.datetime :defunct_at
      t.jsonb :tags, default: []
      t.jsonb :common_core_tags, default: []
      t.jsonb :reviews, default: []
      t.jsonb :screenshot_urls, default: []
      t.jsonb :imported_data, default: {}

      t.timestamps null: false
    end
    add_index :resources, :url, unique: true
    add_index :resources, :tags, using: :gin
  end
end

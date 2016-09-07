class CreateImportedData < ActiveRecord::Migration
  def change
    create_table :imported_data do |t|
      t.string :item_type, null: false
      t.uuid :item_id, null: false
      t.jsonb :data, default: {}

      t.timestamps null: false
    end

    add_index :imported_data, [:item_type, :item_id]
  end
end

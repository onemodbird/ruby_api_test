class CreateKeyValues < ActiveRecord::Migration
  def change
    create_table :key_values, id: :uuid do |t|
      t.string :key, null: false
      t.jsonb :value, null: false
      t.timestamps null: false
    end
    add_index :key_values, :key, unique: true
  end
end

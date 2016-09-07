class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users, id: :uuid do |t|
      t.jsonb :imported_data, default: {}

      t.timestamps null: false
    end

    add_index :users, :imported_data, using: :gin
  end
end

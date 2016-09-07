class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications, id: :uuid do |t|
      t.references :user, index: true, type: :uuid, null: false
      t.string :key, null: false
      t.jsonb :params, null: false, default: {}
      t.boolean :acknowledged, null: false, default: false

      t.timestamps null: false
    end
    add_foreign_key :notifications, :users
  end
end

class CreateSearchConfigs < ActiveRecord::Migration
  def change
    create_table :search_configs, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.string :name
      t.jsonb :config, default: {}, null: false
      t.timestamps null: false
    end
  end
end

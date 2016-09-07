class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions, id: :uuid do |t|
      t.string   :item_type, :null => false
      t.uuid     :item_id,   :null => false
      t.string   :event,     :null => false
      t.uuid     :whodunnit
      t.jsonb    :object
      t.jsonb    :object_changes

      t.uuid     :approved_by
      t.datetime :approved_at

      t.datetime :created_at
    end
    add_index :versions, [:item_type, :item_id]
    add_index :versions, [:approved_at]
  end
end
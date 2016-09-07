class AddFlagsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :flags, :jsonb, default: {}
    add_index :resources, :flags, using: :gin
  end
end

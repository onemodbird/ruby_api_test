class AddFlagsToCollections < ActiveRecord::Migration
  def change
    add_column :collections, :flags, :jsonb, default: {}

    # drop & add to remove the unique constraint
    remove_index :collections, column: :viflearn_k2_category_id, unique: true
    add_index :collections, :viflearn_k2_category_id, unique: false
  end
end

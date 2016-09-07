class AddFlagsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :flags, :jsonb, default: {}
    add_index :users, :flags, using: :gin
  end
end

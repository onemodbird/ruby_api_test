class RemoveDefaultAssignableType < ActiveRecord::Migration
  def change
    change_column :assignments, :assignable_type, :string, null: false, default: false
  end
end

class AddOwnerToResources < ActiveRecord::Migration
  def change
    add_column :resources, :owner, :string
  end
end

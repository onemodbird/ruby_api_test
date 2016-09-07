class AddOerToResources < ActiveRecord::Migration
  def change
    add_column :resources, :oer, :boolean, default: false
  end
end

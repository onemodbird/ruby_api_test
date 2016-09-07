class AddLedeAndDescriptionToResources < ActiveRecord::Migration
  def change
    add_column :resources, :lede, :string
    add_column :resources, :description, :text
  end
end

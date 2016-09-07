class AddPriceToResources < ActiveRecord::Migration
  def change
    add_column :resources, :price, :string
  end
end

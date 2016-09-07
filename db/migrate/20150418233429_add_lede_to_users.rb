class AddLedeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :lede, :string
  end
end

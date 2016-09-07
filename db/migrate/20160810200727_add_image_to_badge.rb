class AddImageToBadge < ActiveRecord::Migration
  def change
    remove_column :badges, :image_url, :string
    add_column :badges, :image, :string
  end
end


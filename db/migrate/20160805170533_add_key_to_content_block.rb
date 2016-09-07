class AddKeyToContentBlock < ActiveRecord::Migration
  def change
    add_column :content_blocks, :key, :string
  end
end

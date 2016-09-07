class AddOriginalContentToContentBlocks < ActiveRecord::Migration
  def change
    add_column :content_blocks, :original_content, :text
  end
end

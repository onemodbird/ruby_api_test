class AddViflearnK2AttachmentIdToContentBlocks < ActiveRecord::Migration
  def change
    add_column :content_blocks, :viflearn_k2_attachment_id, :integer
    add_index :content_blocks, :viflearn_k2_attachment_id
  end
end

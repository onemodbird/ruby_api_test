class AddUploadedFileToContentBlocks < ActiveRecord::Migration
  def change
    add_column :content_blocks, :uploaded_file_id, :uuid
  end
end

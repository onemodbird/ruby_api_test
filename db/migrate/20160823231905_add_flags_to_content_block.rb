class AddFlagsToContentBlock < ActiveRecord::Migration
  def change
    add_column :content_blocks, :flags, :jsonb, default: {}
  end
end

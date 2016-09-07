class CreateContentBlocks < ActiveRecord::Migration
  def change
    create_table :content_blocks, id: :uuid do |t|
      t.uuid :resource_id
      t.string  :title
      t.integer :position
      t.text    :content
      t.string  :kind
      t.timestamps
    end

    add_index :content_blocks, :resource_id
  end
end

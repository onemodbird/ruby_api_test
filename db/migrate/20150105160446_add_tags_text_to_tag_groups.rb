class AddTagsTextToTagGroups < ActiveRecord::Migration
  def change
    add_column :tag_groups, :tags_text, :text
  end
end

class AddExpertiseTagsToUser < ActiveRecord::Migration
  def change
    add_column :users, :expertise_tags, :jsonb, default: []
  end
end

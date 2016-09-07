class AddSubjectAndTopicTagsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :subject_tags, :jsonb, default: []
    add_column :resources, :topic_tags, :jsonb, default: []
  end
end

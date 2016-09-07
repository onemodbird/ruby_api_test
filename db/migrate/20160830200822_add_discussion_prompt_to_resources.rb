class AddDiscussionPromptToResources < ActiveRecord::Migration
  def change
    add_column :resources, :discussion_prompt, :string
  end
end

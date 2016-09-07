class RemoveBadgeIdFromResources < ActiveRecord::Migration
  def change
    remove_column :resources, :badge_id, :uuid
  end
end

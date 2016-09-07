class AddBadgeIdToResource < ActiveRecord::Migration
  def change
    add_column :resources, :badge_id, :uuid
  end
end

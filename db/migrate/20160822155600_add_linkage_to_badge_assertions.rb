class AddLinkageToBadgeAssertions < ActiveRecord::Migration
  def change
    add_column :badge_assertions, :badge_requirement_id, :uuid
    add_column :badge_assertions, :artifact_id, :uuid
  end
end

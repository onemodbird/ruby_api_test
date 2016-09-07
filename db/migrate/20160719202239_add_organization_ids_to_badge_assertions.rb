class AddOrganizationIdsToBadgeAssertions < ActiveRecord::Migration
  def change
    add_column :badge_assertions, :organization_id, :uuid
    add_index :badge_assertions, :organization_id
  end
end

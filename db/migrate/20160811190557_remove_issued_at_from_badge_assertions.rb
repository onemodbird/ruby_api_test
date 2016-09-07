class RemoveIssuedAtFromBadgeAssertions < ActiveRecord::Migration
  def change
    remove_column :badge_assertions, :issued_at, :timestamp
  end
end

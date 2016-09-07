class AddImportedDataToBadgeAssertions < ActiveRecord::Migration
  def change
    add_column :badge_assertions, :imported_data, :jsonb
  end
end

class AddSuperbadgeIdToBadges < ActiveRecord::Migration
  def change
    add_column :badges, :superbadge_id, :uuid
  end
end

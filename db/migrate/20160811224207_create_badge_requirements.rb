class CreateBadgeRequirements < ActiveRecord::Migration
  def change
    create_table :badge_requirements, id: :uuid do |t|
      t.uuid :badge_id
      t.uuid :resource_id
      t.string :interaction_key
      t.string :interaction_kind
      t.string :created_resource_kind
    end
  end
end

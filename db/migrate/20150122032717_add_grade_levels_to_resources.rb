class AddGradeLevelsToResources < ActiveRecord::Migration
  def change
    add_column :resources, :grade_levels, :jsonb, default: []
  end
end

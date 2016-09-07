class AddGradeLevelsToUser < ActiveRecord::Migration
  def change
    add_column :users, :grade_levels, :jsonb, default: []
  end
end

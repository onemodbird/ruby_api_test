class AddLearningRegistryToResources < ActiveRecord::Migration
  def change
    add_column :resources, :learning_registry, :jsonb, null: false, default: {}
  end
end

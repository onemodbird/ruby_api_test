class AddLearningRegistryIdToResources < ActiveRecord::Migration
  def change
    add_column :resources, :learning_registry_id, :string
    add_index :resources, :learning_registry_id, unique: true
  end
end

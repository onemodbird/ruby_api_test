class CreateLearningRegistrySubmissions < ActiveRecord::Migration
  def change
    create_table :learning_registry_submissions, id: :uuid do |t|
      t.uuid :resource_id
      t.boolean :approved
      t.datetime :reviewed_at
      t.timestamp :created_at
    end

    add_index :learning_registry_submissions, :reviewed_at
  end
end

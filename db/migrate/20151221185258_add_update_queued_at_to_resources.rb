class AddUpdateQueuedAtToResources < ActiveRecord::Migration
  def change
    add_column :resources, :update_queued_at, :datetime
    add_index :resources, :update_queued_at
  end
end

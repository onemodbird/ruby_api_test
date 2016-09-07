class AddCanceledAtToScheduledMessages < ActiveRecord::Migration
  def change
    add_column :scheduled_messages, :canceled_at, :datetime
  end
end

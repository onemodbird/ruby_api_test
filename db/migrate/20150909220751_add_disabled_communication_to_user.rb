class AddDisabledCommunicationToUser < ActiveRecord::Migration
  def change
    add_column :users, :disabled_communication, :jsonb, default: [], null: false
  end
end

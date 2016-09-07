class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions, id: :uuid do |t|
      t.uuid :user_id, null: false
      t.uuid :subscribable_id, null: false
      t.string :subscribable_type, null: false
      t.timestamps null: false
    end

    add_index :subscriptions, :user_id
    add_index :subscriptions, :subscribable_id
  end
end

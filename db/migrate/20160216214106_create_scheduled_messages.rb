class CreateScheduledMessages < ActiveRecord::Migration
  def change
    create_table :scheduled_messages, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :image_id
      t.string :text
      t.string :job_id
      t.timestamp :scheduled_at
      t.timestamp :completed_at
      t.string :tweet_id
      t.string :error
      t.timestamp :created_at
    end

    add_index :scheduled_messages, :user_id
  end
end

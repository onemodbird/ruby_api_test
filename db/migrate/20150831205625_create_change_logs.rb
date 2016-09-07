class CreateChangeLogs < ActiveRecord::Migration
  def change
    create_table :change_logs, id: :uuid do |t|
      t.uuid :user_id
      t.uuid :change_loggable_id
      t.string :change_loggable_type
      t.uuid :associated_id
      t.string :associated_type
      t.text :change
      t.timestamp :created_at, null: false
    end

    add_index :change_logs, :change_loggable_id
  end
end

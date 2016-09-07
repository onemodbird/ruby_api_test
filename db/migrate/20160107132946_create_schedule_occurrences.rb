class CreateScheduleOccurrences < ActiveRecord::Migration
  def change
    create_table :schedule_occurrences, id: :uuid do |t|
      t.uuid :schedulable_id, null: false
      t.string :schedulable_type, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps null: false
    end

    add_index :schedule_occurrences, :schedulable_id
  end
end

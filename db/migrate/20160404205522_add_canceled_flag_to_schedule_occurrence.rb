class AddCanceledFlagToScheduleOccurrence < ActiveRecord::Migration
  def change
    add_column :schedule_occurrences, :canceled, :boolean, default: false
  end
end

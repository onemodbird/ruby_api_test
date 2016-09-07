class AddScheduleOccurrenceIdIndexToSummaries < ActiveRecord::Migration
  def change
    add_index :chat_occurrence_summaries, :schedule_occurrence_id
  end
end

class CreateChatOccurrenceSummaries < ActiveRecord::Migration
  def change
    create_table :chat_occurrence_summaries, id: :uuid do |t|
      t.uuid :schedule_occurrence_id
      t.uuid :transcript_id
      t.jsonb :analytics, default: {}
      t.jsonb :moderators, default: {}
      t.timestamps
    end
  end
end

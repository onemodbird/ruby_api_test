class AdOmittedMessageIdsToTranscript < ActiveRecord::Migration
  def change
    add_column :transcripts, :omitted_message_ids, :jsonb, default: []
  end
end

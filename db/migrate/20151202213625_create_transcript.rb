class CreateTranscript < ActiveRecord::Migration
  def change
    create_table :transcripts, id: :uuid do |t|
      t.datetime :begin_at, null: false
      t.datetime :end_at, null: false
      t.uuid :user_id, null: false
      t.uuid :chat_id, null: false
      t.timestamps null: false
    end
  end
end

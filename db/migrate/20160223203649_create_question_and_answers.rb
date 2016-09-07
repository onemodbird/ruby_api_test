class CreateQuestionAndAnswers < ActiveRecord::Migration
  def change
    create_table :question_and_answers, id: :uuid do |t|
      t.uuid :qa_session_id, null: false
      t.uuid :chat_message_id, null: false
      t.boolean :question, null: false
      t.integer :question_number, null: false

      t.timestamps null: false
    end
  end
end

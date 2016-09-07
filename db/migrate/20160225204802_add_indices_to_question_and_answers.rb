class AddIndicesToQuestionAndAnswers < ActiveRecord::Migration
  def change
    add_index :question_and_answers, :qa_session_id
    add_index :question_and_answers, :created_at
  end
end

class AddChatIdToQuestionAndAnswers < ActiveRecord::Migration
  def change
    add_column :question_and_answers, :chat_id, :uuid
    add_index :question_and_answers, :chat_id
  end
end

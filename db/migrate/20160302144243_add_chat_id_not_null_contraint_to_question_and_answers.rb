class AddChatIdNotNullContraintToQuestionAndAnswers < ActiveRecord::Migration
  def change
    change_column_null :question_and_answers, :chat_id, false
  end
end

class QAAnswerSerializer < BaseSerializer
  attributes :question_number, :chat_message

  def question_number
    object.question_number
  end

  def chat_message
    ChatMessageSerializer.serialize(object.chat_message)
  end
end

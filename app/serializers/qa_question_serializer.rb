class QAQuestionSerializer < BaseSerializer
  attributes :number, :chat_message, :answers

  def number
    object.number
  end

  def chat_message
    ChatMessageSerializer.serialize(object.chat_message)
  end

  def answers
    QAAnswerSerializer.list(object.answers)
  end
end

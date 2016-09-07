class QASessionSerializer < BaseSerializer
  attributes :id, :questions

  def id
    object.id
  end

  def questions
    QAQuestionSerializer.list(object.questions)
  end
end

require "rails_helper"

describe QASessionSerializer do
  let!(:question) { create :question_and_answer, :question }
  let!(:answer) { create :question_and_answer, :answer,
    question_number: question.question_number,
    qa_session_id: question.qa_session_id }
  let!(:answer_to_other_question) { create :question_and_answer, :answer,
    question_number: question.question_number + 1,
    qa_session_id: question.qa_session_id }
  let(:qa_session) { QASession.find(question.qa_session_id) }
  let(:serialized) { QASessionSerializer.serialize(qa_session) }
  let(:serialized_question) { serialized[:questions].first }
  let(:serialized_answer) { serialized.dig(:questions, 0, :answers, 0) }

  it "includes the Q&A session ID" do
    expect(serialized[:id]).to eq(question.qa_session_id)
  end

  it "includes questions" do
    expect(serialized[:questions].size).to eq(1)
    expect(serialized_question[:number]).to eq(1)
    expect(serialized_question[:chat_message])
      .to eq(ChatMessageSerializer.serialize(question.chat_message))
  end

  it "includes answers" do
    expect(serialized_question[:answers].size).to eq(1)
    expect(serialized_answer[:chat_message])
      .to eq(ChatMessageSerializer.serialize(answer.chat_message))
  end
end

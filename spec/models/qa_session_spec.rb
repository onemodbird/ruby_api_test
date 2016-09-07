require "rails_helper"

describe QASession do
  let(:transcript) { create :transcript }
  let(:message_1_1) { create :chat_message, chat: transcript.chat }
  let(:message_2_1) { create :chat_message, chat: transcript.chat }
  let(:question_1_1) { create :question_and_answer, :question, chat_message: message_1_1 }
  let(:question_2_1) { create :question_and_answer, :question, chat_message: message_2_1 }

  it "returns transcript Q&A session IDs in reverse-chronological order" do
    Timecop.freeze(transcript.begin_at + 1) { question_1_1 }
    Timecop.freeze(transcript.end_at - 1) { question_2_1 }

    qa_session_ids = QASession.send(:qa_session_ids_for_transcript, transcript)

    expect(question_1_1.created_at).to be < question_2_1.created_at
    expect(qa_session_ids).to eq([ question_2_1.qa_session_id, question_1_1.qa_session_id ])
  end
end

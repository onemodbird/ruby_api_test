require "rails_helper"

describe Appo::Api::QASessions do
  let(:user) { create :user }
  let(:question) { create :question_and_answer, :question }
  let(:answer) { create :question_and_answer, :answer,
    question_number: question.question_number }

  it "403s when the request is unauthenticated" do
    get "/v1/qa_sessions/#{question.qa_session_id}"
    expect_response_code_of 403
  end

  it "404s when no question_and_answers are found" do
    api_get "/v1/qa_sessions/#{SecureRandom.uuid}", user
    expect_response_code_of 404
  end

  it "finds a Q&A session" do
    api_get "/v1/qa_sessions/#{question.qa_session_id}", user
    expect_response_code_of 200
    expect(json_response.fetch("id")).to eq(question.qa_session_id)
  end
end

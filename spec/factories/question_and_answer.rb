FactoryGirl.define do
  factory :question_and_answer do
    qa_session_id { SecureRandom.uuid }
    chat_message
    question_number { 1 }

    after :build do |question_and_answer|
      question_and_answer.chat =
        question_and_answer.chat_message.chat
    end
  end

  trait :question_with_answer do
    question true

    after :create do |question_and_answer|
      chat_message =
        create :chat_message,
          chat: question_and_answer.chat_message.chat,
          tweeted_at: question_and_answer.chat_message.tweeted_at

      create :question_and_answer, :answer,
        qa_session_id: question_and_answer.qa_session_id,
        question: false,
        question_number: question_and_answer.question_number,
        chat_message: chat_message,
        created_at: question_and_answer.created_at
    end
  end

  trait :question do
    question { true }
  end

  trait :answer do
    question { false }
  end
end

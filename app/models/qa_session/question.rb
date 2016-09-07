class QASession
  class Question
    attr_reader :answers

    def initialize(question, answers = [])
      @question = question
      @answers = answers
    end

    def number
      @question.question_number
    end

    def chat_message
      @question.chat_message
    end
  end
end

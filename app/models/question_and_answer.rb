class QuestionAndAnswer < ActiveRecord::Base
  belongs_to :chat
  belongs_to :chat_message

  validates_presence_of :chat_id # keep this until NOT NULL is set in the DB

  SESSION_REGEX = /\A\s*(?:Q|Question) ?1\b/i
  QUESTION_REGEX = /\A\s*(?:Q|Question) ?(\d+)\b/i
  ANSWER_REGEX = /\A\s*(?:A|Answer) ?(\d+)\b/i

  class << self
    def process(chat, message)
      return if message.retweet

      if message_starts_new_qa_session?(chat, message)
        start_new_qa_session(chat, message)
        question = add_question(chat, message)
        send_realtime(:qa_session_created, chat, question)
      elsif message_is_question_for_existing_qa_session?(chat, message)
        question = find_question(chat, message)
        if question
          question.update!(chat_message: message)
          send_realtime(:qa_question_updated, chat, question)
        else
          question = add_question(chat, message)
          send_realtime(:qa_question_created, chat, question)
        end
      elsif message_is_answer_for_existing_qa_session?(chat, message)
        answers = add_answer(chat, message)
        answers.each do |answer|
          send_realtime(:qa_answer_created, chat, answer)
        end
      end
    end

    private

    def message_starts_new_qa_session?(chat, message)
      return false unless chat.is_moderator?(pseudo_user(message))
      return false unless message.text =~ SESSION_REGEX
      !question_one_can_be_replaced?(chat)
    end

    def message_is_question_for_existing_qa_session?(chat, message)
      return false unless chat.current_qa_session_id
      return false unless chat.is_moderator?(pseudo_user(message))
      message.text =~ QUESTION_REGEX
    end

    def message_is_answer_for_existing_qa_session?(chat, message)
      return false unless chat.current_qa_session_id
      message.text =~ ANSWER_REGEX
    end

    def question_one_can_be_replaced?(chat)
      return false unless chat.current_qa_session_id
      qa_session_has_only_one_question?(chat)
    end

    def qa_session_has_only_one_question?(chat)
      QuestionAndAnswer.where(
        qa_session_id: chat.current_qa_session_id,
        question: true)
      .count == 1
    end

    def find_question(chat, message)
      QuestionAndAnswer.find_by(
        qa_session_id: chat.current_qa_session_id,
        chat_id: chat.id,
        question: true,
        question_number: extract_question_number(message.text))
    end

    def start_new_qa_session(chat, message)
      chat.update!(current_qa_session_id: SecureRandom.uuid)
    end

    def extract_question_number(text)
      text[QUESTION_REGEX, 1]
    end

    def add_question(chat, message)
      question_number = extract_question_number(message.text)
      create!(
        qa_session_id: chat.current_qa_session_id,
        chat: chat,
        chat_message: message,
        question: true,
        question_number: question_number)
    end

    def add_answer(chat, message)
      question_numbers = message.text.scan(ANSWER_REGEX).flatten
      question_numbers.map do |question_number|
        next unless where(
          qa_session_id: chat.current_qa_session_id,
          question: true,
          question_number: question_number).exists?

        create!(
          qa_session_id: chat.current_qa_session_id,
          chat: chat,
          chat_message: message,
          question: false,
          question_number: question_number)
      end
      .compact
    end

    def send_realtime(event, chat, question_and_answer)
      payload =
        case event
        when :qa_session_created
          QASessionSerializer.serialize(
            QASession.new([question_and_answer]))
        when :qa_question_created, :qa_question_updated
          QAQuestionSerializer.serialize(
            QASession::Question.new(question_and_answer))
        when :qa_answer_created
          QAAnswerSerializer.serialize(question_and_answer)
        else
          raise "Unknown event: #{event}"
        end
      RealtimeService.publish([chat], event, false, payload)
    end

    # doing this PseudoUser thing to use chat.is_moderator? without
    # needing to query the database via message.user
    PseudoUser = Struct.new(:twitter_id)
    def pseudo_user(message)
      PseudoUser.new(message.twitter_id.to_s)
    end
  end
end

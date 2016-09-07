class QASession
  class << self
    def find(id, omitted_message_ids = nil)
      results = QuestionAndAnswer.where(qa_session_id: id)

      if omitted_message_ids.present?
        results = results.where("chat_message_id NOT IN (?)", omitted_message_ids)
      end

      results = results
        .includes(:chat_message)
        .order(question: :desc, question_number: :asc, created_at: :asc)
        .to_a

      raise ActiveRecord::RecordNotFound if results.empty?

      new(results)
    end

    def for_transcript(transcript)
      qa_session_ids_for_transcript(transcript).map { |id| find(id, transcript.omitted_message_ids) }
    end

    def questions_for_transcript(transcript)
      questions_or_answers_for_transcript(transcript, true)
    end

    def answers_for_transcript(transcript)
      questions_or_answers_for_transcript(transcript, false)
    end

    private

    def questions_or_answers_for_transcript(transcript, is_question)
      QuestionAndAnswer
        .where(chat_id: transcript.chat_id)
        .where(question: is_question)
        .where("created_at >= ?", transcript.begin_at)
        .where("created_at <= ?", transcript.end_at)
        .order(created_at: :desc)
    end

    def qa_session_ids_for_transcript(transcript)
      query = questions_for_transcript(transcript)

      if transcript.omitted_message_ids.present?
        query = query.where.not(chat_message_id: transcript.omitted_message_ids)
      end

      query.pluck(:qa_session_id).uniq
    end
  end

  attr_reader :id, :questions

  def initialize(question_and_answers)
    @id = question_and_answers.first.qa_session_id
    @questions = question_and_answers
      .group_by(&:question_number)
      .map { |_, (q, *answers)| Question.new(q, answers) if q.question }
      .compact
      .sort_by(&:number)
  end
end

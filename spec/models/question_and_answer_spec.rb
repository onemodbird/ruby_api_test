require "rails_helper"

RSpec.describe QuestionAndAnswer, type: :model do
  let(:twitter_id) { moderator.twitter_id }
  let(:chat) { create :chat, :with_moderators, current_qa_session_id: nil }
  let(:moderator) { User.find_by(twitter_id: chat.moderators.values.first["id"])}
  let(:qa_session_id) { SecureRandom.uuid }
  let(:last) { QuestionAndAnswer.order(created_at: :desc).take }
  let(:fake_chat) {
    double :chat,
      is_moderator?: true,
      current_qa_session_id: SecureRandom.uuid }

  def fake_message(text)
    double :chat_message, text: text, twitter_id: "1"
  end

  def moderator_message(text)
    create :chat_message, chat: chat, user: moderator, twitter_id: twitter_id, text: text
  end

  def non_moderator_message(text)
    create :chat_message, chat: chat, text: text
  end

  describe "Q&A detection" do

    detectables = {
      [:message_starts_new_qa_session?, "a new Q&A session"] =>
        ["Q1", "Q 1", "Question1", "Question 1"],
      [:message_is_question_for_existing_qa_session?, "a question"] =>
        ["Q2", "Q 2", "Question2", "Question 2"],
      [:message_is_answer_for_existing_qa_session?, "an answer"] =>
        ["A2", "A 2", "Answer2", "Answer 2"] }

    detectables.each do |(method, label), values|
      lowercased = values.map(&:downcase)
      whitespace_prefixed = values.map { |s| " #{s}" }

      (values + lowercased + whitespace_prefixed).each do |text|
        it "detects '#{text}' as #{label}" do
          chat = fake_chat
          message = fake_message(text)
          expect(QuestionAndAnswer.send(method, chat, message)).to be_truthy
        end
      end
    end

  end

  describe ".process" do
    before :each do
      allow(SecureRandom).to receive(:uuid).and_return(qa_session_id)
      allow(RealtimeService).to receive(:publish)
    end

    it "starts a new QA session when a moderator tweets Q1" do
      message = moderator_message("Q1: What's up?")
      expect { QuestionAndAnswer.process(chat, message) }
        .to change(chat, :current_qa_session_id).from(nil).to(qa_session_id)

      expect(last.qa_session_id).to eq(qa_session_id)
      expect(last.chat_id).to eq(chat.id)
      expect(last.chat_message_id).to eq(message.id)
      expect(last.question).to eq(true)
      expect(last.question_number).to eq(1)

      expect(RealtimeService)
        .to have_received(:publish)
        .with(
          [chat],
          :qa_session_created,
          false,
          QASessionSerializer.serialize(QASession.new([last])))
    end

    it "requires the question text to be at the beginning of the tweet" do
      message = moderator_message("RT Q1: What's up?")
      expect { QuestionAndAnswer.process(chat, message) }
        .not_to change(chat, :current_qa_session_id)
    end

    it "ignores Q1 tweets from non-moderators" do
      message = non_moderator_message("Q1: What's up?")
      expect { QuestionAndAnswer.process(chat, message) }
        .not_to change(chat, :current_qa_session_id)
    end

    it "ignores Q(n) tweets from moderators when no session and n > 1" do
      message = moderator_message("Q2: What's up?")
      expect { QuestionAndAnswer.process(chat, message) }
        .not_to change(chat, :current_qa_session_id)
    end

    describe "existing QA session" do
      before :each do
        chat.update(current_qa_session_id: qa_session_id)
      end

      it "adds moderator questions > 1" do
        message = moderator_message("Q2: Now what?")
        QuestionAndAnswer.process(chat, message)

        expect(last.qa_session_id).to eq(qa_session_id)
        expect(last.chat_id).to eq(chat.id)
        expect(last.chat_message_id).to eq(message.id)
        expect(last.question).to eq(true)
        expect(last.question_number).to eq(2)

        expect(RealtimeService)
          .to have_received(:publish)
          .with(
            [chat],
            :qa_question_created,
            false,
            QAQuestionSerializer.serialize(QASession::Question.new(last)))
      end

      it "updates Q1 from moderator (& retains session) if ONLY Q1 exists" do
        message1 = moderator_message("Q1: New Session")
        QuestionAndAnswer.process(chat, message1)

        message2 = moderator_message("Q1: Updated Question")
        expect { QuestionAndAnswer.process(chat, message2) }
          .to not_change(QuestionAndAnswer, :count)
          .and not_change { chat.reload.current_qa_session_id }
          .and change { last.reload.chat_message_id }
            .from(message1.id)
            .to(message2.id)
      end

      it "updates moderator questions > 1 if they exist" do
        message = moderator_message("Q2 Coming in 3 minutes...")
        QuestionAndAnswer.process(chat, message)
        expect(last.chat_message_id).to eq(message.id)

        message2 = moderator_message("Q2: Now what?")
        QuestionAndAnswer.process(chat, message2)

        last.reload
        expect(last.chat_message_id).to eq(message2.id)

        expect(last.qa_session_id).to eq(qa_session_id)
        expect(last.chat_id).to eq(chat.id)
        expect(last.question).to eq(true)
        expect(last.question_number).to eq(2)

        serialized =
          QAQuestionSerializer.serialize(QASession::Question.new(last))

        expect(serialized.dig(:chat_message, :id)).to eq(message2.id)

        expect(RealtimeService)
          .to have_received(:publish)
          .with([chat], :qa_question_updated, false, serialized)
      end

      it "adds answers to existing questions" do
        QuestionAndAnswer.process(chat, moderator_message("Q1: Works?"))

        message = non_moderator_message("A1: Yes")
        QuestionAndAnswer.process(chat, message)

        expect(last.qa_session_id).to eq(qa_session_id)
        expect(last.chat_id).to eq(chat.id)
        expect(last.chat_message_id).to eq(message.id)
        expect(last.question).to eq(false)
        expect(last.question_number).to eq(1)

        expect(RealtimeService)
          .to have_received(:publish)
          .with(
            [chat],
            :qa_answer_created,
            false,
            QAAnswerSerializer.serialize(last))
      end

      it "requires answer indicator to be at the beginning of the tweet" do
        message = moderator_message("Q1: Works?")
        QuestionAndAnswer.process(chat, message)

        detected_answer = non_moderator_message("A1: Yes")
        expect { QuestionAndAnswer.process(chat, detected_answer) }
          .to change(QuestionAndAnswer, :count)

        ignored_answer = non_moderator_message("RT A1: Yes")
        expect { QuestionAndAnswer.process(chat, ignored_answer) }
          .not_to change(QuestionAndAnswer, :count)
      end

      it "ignores answers to non-existing questions" do
        QuestionAndAnswer.process(chat, moderator_message("Q1: Works?"))

        message = non_moderator_message("A2: Nope")
        expect { QuestionAndAnswer.process(chat, message) }
          .not_to change(QuestionAndAnswer, :count)
      end
    end

  end
end

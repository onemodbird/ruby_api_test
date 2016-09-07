require "rails_helper"

RSpec.describe ScheduleOccurrence, type: :model do
  let(:chat) { create :chat }
  let(:id) { SecureRandom.uuid }
  let(:start_time) { (Time.now + 1.hour).change(usec: 0) } # zero out milliseconds
  let(:end_time) { (Time.now + 2.hour).change(usec: 0) }
  let(:during) { start_time + 1.minute }
  let(:schedule_occurrence) do
    create :schedule_occurrence,
      id: id,
      schedulable: chat,
      start_time: start_time,
      end_time: end_time
  end

  it "schedules and on_start and on_complete jobs" do
    expect(ScheduleOccurrenceStartJob).to receive(:perform_at).with(start_time, id)
    expect(ScheduleOccurrenceCompleteJob).to receive(:perform_at).with(end_time, id)
    schedule_occurrence # touch
  end

  it "deletes scheduled occurrences when chat is archived" do
    schedule_occurrence # touch
    expect { chat.archive! }.to change(
      chat.schedule_occurrences, :count).from(1).to(0)
  end

  context "with a transcript message threshold" do
    before do
      stub_const("ScheduleOccurrence::TRANSCRIPT_MESSAGE_THRESHOLD", 2)
    end

    it "achieves transcript message threshold" do
      create_list :chat_message, 2, chat: chat, tweeted_at: during

      expect(schedule_occurrence.achieved_transcript_threshold?).to eq true
    end

    it "fails transcript message threshold" do
      create :chat_message, chat: chat, tweeted_at: during

      expect(schedule_occurrence.achieved_transcript_threshold?).to eq false
    end

    it "creates a transcript if message threshold is achieved" do
      create_list :chat_message, 2, chat: chat, tweeted_at: during
      schedule_occurrence.on_complete

      expect(schedule_occurrence.canceled?).to eq false
      expect(schedule_occurrence.chat_occurrence_summary).to_not be_nil
    end

    it "marks an occurrence canceled that failed the message threshold" do
      create :chat_message, chat: chat, tweeted_at: during
      schedule_occurrence.on_complete

      expect(schedule_occurrence.canceled?).to eq true
      expect(schedule_occurrence.chat_occurrence_summary).to be_nil
    end
  end
end

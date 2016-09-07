require "rails_helper"

RSpec.describe ScheduleOccurrenceJob, type: :job do

  let(:chat) { create :chat }
  let!(:past_occurrence) {
    create :schedule_occurrence,
      schedulable: chat,
      start_time: 1.day.ago
  }
  let!(:future_occurrence) {
    create :schedule_occurrence,
      schedulable: chat,
      start_time: 1.day.from_now
  }

  it "retains past schedule occurrences" do
    ScheduleOccurrenceJob.new.perform("Chat", chat.id)
    expect(ScheduleOccurrence.find_by(id: past_occurrence.id)).not_to eq(nil)
    expect(ScheduleOccurrence.find_by(id: future_occurrence.id)).to eq(nil)
  end
end

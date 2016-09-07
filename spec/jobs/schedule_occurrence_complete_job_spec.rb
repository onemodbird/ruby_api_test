require "rails_helper"

RSpec.describe ScheduleOccurrenceCompleteJob, type: :job do
  let(:chat) { create :chat }
  let(:schedule_occurrence) { create :schedule_occurrence, schedulable: chat }

  it "calls on_complete" do
    expect_any_instance_of(ScheduleOccurrence).to receive(:on_complete)
    ScheduleOccurrenceCompleteJob.new.perform(schedule_occurrence.id)
  end

  it "does not call on_complete" do
    expect_any_instance_of(ScheduleOccurrence).to_not receive(:on_complete)
    ScheduleOccurrenceCompleteJob.new.perform("nope")
  end
end

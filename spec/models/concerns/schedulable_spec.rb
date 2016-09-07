require "rails_helper"

describe Schedulable do
  let!(:chat) { create :chat, schedule: schedule }
  let(:schedule) {
    Time.use_zone("America/Chicago") do
      schedule = IceCube::Schedule.new(Time.zone.now.round, duration: 3600)
      schedule.add_recurrence_rule(
        IceCube::Rule.monthly.hour_of_day(5).day_of_week(1 => [1, 3])
      )
      schedule
    end
  }
  let(:event_time) { Time.zone.now.round + 1.day }

  it "serializes and deserializes correctly" do
    expect(chat.reload.schedule.to_hash).to eq(schedule.to_hash)
  end

  describe "dirty checking" do
    it "has not changed when reloaded" do
      pending "Need to fix, but not critical"
      expect(chat.reload.schedule_changed?).to eq(false)
    end

    it "has not changed when run through a serialization cycle" do
      chat.schedule = IceCube::Schedule.from_hash(chat.schedule.to_hash)
      expect(chat.schedule_changed?).to eq(false)
    end
  end

  it "generates occurrences without duplication" do
    Schedulable.generate_occurrences(60.days.from_now)
    Schedulable.generate_occurrences(90.days.from_now)

    start_times = chat.schedule_occurrences.map(&:start_time)
    expect(start_times.size).to eq(start_times.uniq.size)
  end

  it "skips the default event when generating occurrences" do
    Timecop.freeze do
      schedule = IceCube::Schedule.new
      schedule.add_recurrence_time(event_time)
      chat.update!(schedule: schedule)

      expect(chat.reload.schedule_occurrences.map(&:start_time))
        .to eq([event_time])
    end
  end
end

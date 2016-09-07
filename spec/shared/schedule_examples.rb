RSpec.shared_examples "schedule examples" do

  it "does not save if the schedule is unchanged" do
    expect(Chat).to receive(:find).with(chat.id).and_return(chat)
    expect(chat).to_not receive(:save!)
    update
  end

  it "changes the duration" do
    update(schedule_duration: 1)
    expect(chat.reload.schedule.duration).to eq(1*60)
  end

  it "changes the time" do
    update(schedule_times: ["03:33", "19:00"])

    chat.reload
    hour_of_day = chat.schedule.rrules.first.validations[:hour_of_day]
    minute_of_hour = chat.schedule.rrules.first.validations[:minute_of_hour]

    expect(hour_of_day.first.hour).to eq(3)
    expect(minute_of_hour.first.minute).to eq(33)
  end

  it "changes the recurrence rules" do
    rule = {
      rule_type: "IceCube::WeeklyRule",
      validations: { day: [2] },
      interval: 1,
      week_start: 0
    }.to_json

    update(schedule_rules: [rule])

    chat.reload
    day = chat.schedule.rrules.first.validations[:day]

    expect(chat.schedule.rrules.size).to eq(1)
    expect(day.first.day).to eq(2)
  end

  it "sets the schedule to nil when all rules are removed" do
    update(schedule_rules: [])
    expect(chat.reload.schedule).to be_nil
  end

end

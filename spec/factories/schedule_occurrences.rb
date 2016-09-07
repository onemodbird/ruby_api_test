FactoryGirl.define do
  factory :schedule_occurrence do
    start_time { Time.now + 1.day }
    after(:build) do |so|
      so.end_time = so.start_time + 1.hour
    end
  end
end

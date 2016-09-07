FactoryGirl.define do
  factory :chat do
    sequence(:name) { |n| "##{Faker::Internet.user_name}_#{n}" }
    description { Faker::Hacker.say_something_smart }
    current_qa_session_id { SecureRandom.uuid }
  end

  trait :featured do
    featured true
  end

  trait :with_messages do
    after(:build) do |chat|
      chat.chat_messages = build_list(:chat_message, 2)
    end
  end

  trait :with_schedule do
    schedule do
      IceCube::Schedule.new.tap do |s|
        s.duration = 1.hour

        weekly_on_mondays_at_11am =
          IceCube::WeeklyRule.new
            .day(:monday)
            .hour_of_day(11)
            .minute_of_hour(0)
            .second_of_minute(0)

        weekly_on_fridays_at_7pm =
          IceCube::WeeklyRule.new
            .day(:friday)
            .hour_of_day(19)
            .minute_of_hour(0)
            .second_of_minute(0)

        s.add_recurrence_rule weekly_on_mondays_at_11am
        s.add_recurrence_rule weekly_on_fridays_at_7pm
      end
    end
  end

  trait :with_moderators do
    after(:build) do |chat|
      users = 2.times do
        user = create(:user,
          twitter_id: rand(10000).to_s,
          twitter_username: Faker::Lorem.words(3).join(""))

        chat.moderators[user.twitter_username] = {
          "id" => user.twitter_id,
          "twitter_profile_image_url" => TwitterService.profile_img(user.twitter_username)
        }
      end
    end
  end
end

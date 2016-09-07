FactoryGirl.define do
  factory :chat_message do
    tweeted_at { Time.now }
    chat
    text { Faker::Lorem.sentence }
    tweet_id { rand(10000000000 )}
    twitter_handle { Faker::Internet.user_name }

    trait :with_resource do
      after(:build) do |chat_message|
        chat_message.chat_resources =
          [build(:chat_resource, chat: chat_message.chat)]
      end
    end
  end
end

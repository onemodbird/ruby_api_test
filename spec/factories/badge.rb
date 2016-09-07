FactoryGirl.define do
  factory :badge do
    name { Faker::Lorem.words(2).join(" ") }
    description { Faker::Hacker.say_something_smart }
    image { [*Faker::Lorem.words(2), ".png"].join }
    criteria_url { Faker::Internet.url }
  end
end

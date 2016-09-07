FactoryGirl.define do
  factory :scheduled_message do
    user
    text { Faker::Lorem.words(3).join(" ") + " #hashtag" }
    scheduled_at { Time.now + 1.day }
  end

  trait :with_image do
    image_file { File.open(Rails.root.join("spec/fixtures/pixel.png")) }
  end
end

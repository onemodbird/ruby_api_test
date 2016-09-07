FactoryGirl.define do
  factory :content_block do
    association :resource
    title "HTML Content"
    kind "html"
    content { "<h1>#{Faker::Lorem.sentence}</h1><h2>#{Faker::Lorem.sentence}</h2>" }
    original_content { "<h1>#{Faker::Lorem.sentence}</h1><h2>#{Faker::Lorem.sentence}</h2>" }

    trait :html do
      # Placeholder for the standard "html" version
    end

    trait :image do
      kind "image"
      title "Image Content"
      content { Faker::Company.logo }
    end

    trait :video do
      kind "video"
      title "Video Content"
      content { Faker::Internet.url }
    end

    trait :discussion do
      kind "interactive"
      title "Discussion Content"
      content { Faker::Hacker.say_something_smart }
    end
  end
end

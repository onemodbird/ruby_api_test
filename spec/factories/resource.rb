FactoryGirl.define do
  factory :resource do
    kind "webpage"
    name { Faker::Lorem.words(3).join(" ") }
    url { Faker::Internet.url }
    price "Free"
    visibility "public"

    trait :vif do
      imported_data do
        {
          created_by: 943,
          extra_fields: {"id": 26, "name": "Authored By", "value": "VIF"}
        }
      end
    end

    trait :file do
      kind "file"
      url { Faker::Internet.url }
    end

    trait :webpage do
      kind "webpage"
      url { Faker::Internet.url }
    end

    trait :video do
      kind "video"
      url { "https://www.youtube.com/watch?v=#{SecureRandom.hex[0,11]}" }
    end

    trait :ios_app do
      kind "app"
      sequence(:url) { |n| "https://itunes.apple.com/app/id#{n}" }
    end

    trait :android_app do
      kind "app"
      url {
        "https://play.google.com/store/apps/details?id=" <<
        Faker::Internet.domain_name
      }
    end

    trait :ibook do
      kind "ibook"
      sequence(:url) { |n| "https://itunes.apple.com/ibook/id#{n}" }
    end

    trait :course do
      kind "course"
      transient do
        content_block_count 3
      end

      after(:create) do |resource, evaluator|
        traits = %i(html)

        evaluator.content_block_count.times do |i|
          create(:content_block, traits[i] || :html, resource: resource)
        end

        resource.content_blocks.reload
      end
    end

    trait :course_with_badge_requirements do
      kind "course"

      after(:create) do |resource, evaluator|
        badge = create(:badge)

        { one: "interaction_one", two: "interaction_two" }.each_pair do |k,v|
          resource.badge_requirements.create badge: badge,
            interaction_key: k,
            interaction_kind: v,
            created_resource_kind: "learning_product"
        end
      end
    end

  end
end

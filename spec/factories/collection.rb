FactoryGirl.define do
  factory :collection do
    name { Faker::Lorem.words(3).join(" ") }
    association :user, :registered

    trait :with_resources do
      transient do
        resources_count 5
      end

      after(:create) do |collection, evaluator|
        create_list(:collection_resource, evaluator.resources_count, collection: collection, user: collection.user)
        collection.collection_resources.reload
        collection.resources.reload
      end
    end

    trait :with_courses do
      transient do
        courses_count 2
      end

      after(:create) do |collection, evaluator|
        evaluator.courses_count.times do
          collection.add_resource collection.user, create(:resource, :course_with_badge_requirements).id
        end
        collection.collection_resources.reload
        collection.resources.reload
      end
    end
  end
end

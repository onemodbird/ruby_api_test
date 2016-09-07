FactoryGirl.define do
  factory :school, parent: :organization, class: "School" do
    type "School"

    trait :with_assignments do
      after(:create) do |school, evaluator|
        school.assign(create(:collection, :with_courses, courses_count: 4))
        school.assign(create(:collection, :with_resources, resources_count: 1))
      end
    end
  end
end

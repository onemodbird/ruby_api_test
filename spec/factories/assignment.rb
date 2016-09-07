FactoryGirl.define do
  factory :assignment do
    association :user, :registered
    assignable { |a| a.association(:collection, :with_resources) }

    trait :with_badge_requirements do
      assignable { |a| a.association(:resource, :course_with_badge_requirements) }
    end
  end
end

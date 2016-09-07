FactoryGirl.define do
  factory :badge_assertion do
    association :badge
    association :user
  end
end

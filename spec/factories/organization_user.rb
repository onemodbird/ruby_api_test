FactoryGirl.define do
  factory :organization_user do
    association :user
    association :organization
  end
end

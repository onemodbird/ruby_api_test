FactoryGirl.define do
  factory :comment do
    association :user
    association :commentable, factory: :collection
    content { Faker::Lorem.sentence }
  end
end

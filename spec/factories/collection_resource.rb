FactoryGirl.define do
  factory :collection_resource do
    association :resource
    sequence(:position, 1)
  end
end

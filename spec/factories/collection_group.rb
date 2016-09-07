FactoryGirl.define do
  factory :collection_group do
    association :user, :registered
    name { Faker::Lorem.words(2).join(" ") }
  end
end

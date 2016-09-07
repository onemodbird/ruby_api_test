FactoryGirl.define do
  factory :notification do
    association :user, :registered
    key :key
    params Hash.new
  end
end

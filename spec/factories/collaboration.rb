FactoryGirl.define do
  factory :collaboration do
    association :user, :registered
    email { Faker::Internet.email }

    after(:build) do |collaboration|
      collaboration.collaboratable =
        create :collection, user: collaboration.user
    end

    trait :active do
      association :collaborator, factory: [:user, :registered]
      status "active"
    end

    trait :pending_user do
      email nil
      association :collaborator, factory: [:user, :registered]
      status "pending"
    end
  end
end

FactoryGirl.define do
  factory :organization do
    name { [type, *Faker::Lorem.words(2)].join(" ") }
    salesforce_id { SecureRandom.uuid }

    trait :with_admin do
      after(:create) do |organization|
        organization.organization_users <<
          create(:organization_user, organization: organization, role: "admin")
      end
    end

    trait :with_users do
      transient do
        user_count 2
      end

      after(:create) do |organization, evaluator|
        create_list(:organization_user, evaluator.user_count, organization: organization)

        organization.organization_users.reload
        organization.users.reload
      end
    end
  end
end

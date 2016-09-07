FactoryGirl.define do
  factory :district, parent: :organization, class: "District" do
    type "District"

    trait :with_schools do
      transient do
        school_count 1
      end

      after(:create) do |organization, evaluator|
        create_list(:school, evaluator.school_count, disctrict_id: organization.id)
      end
    end
  end
end

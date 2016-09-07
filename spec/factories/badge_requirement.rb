FactoryGirl.define do
  factory :badge_requirement do
    association :badge
    association :resource, :course
    interaction_key "reflect_revise_#{Faker::Lorem.words(2).join("_")}"
    interaction_kind "reflect_revise"
    created_resource_kind "learning_product"
  end
end

FactoryGirl.define do
  factory :review do
    user
    resource
    comment "comment"

    trait :expert do
      association :user, :expert
    end

    trait :score_30 do
      content_score 10
      feature_score 10
      engagement_score 10
    end

    after(:create) do |review|
      resource = review.resource
      resource.reviews << review.attributes
      resource.save!
    end
  end
end

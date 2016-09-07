FactoryGirl.define do
  factory :article do
    user
    title { Faker::Book.title }
    published_at { 1.minute.ago }
  end
end

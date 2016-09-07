FactoryGirl.define do
  factory :bookmark do
    user_id { SecureRandom.uuid }
    url { Faker::Internet.url }
    normalized_url { Appo::URI.clean(url) }
  end
end

FactoryGirl.define do
  factory :transcript do
    begin_at { Time.now - (rand(3) + 1).hours }
    end_at { Time.now }
    chat
    user
  end
end

FactoryGirl.define do
  factory :chat_invitation do
    user
    chat
    email { Faker::Internet.email }
  end
end

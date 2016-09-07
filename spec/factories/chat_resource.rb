FactoryGirl.define do
  factory :chat_resource do
    association :chat_message
    association :chat
    association :resource
  end
end

FactoryGirl.define do
  factory :auth_response, class: Authentication::AuthResponse do
    skip_create
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    email { Faker::Internet.email }
    provider "twitter"
    provider_id { rand(10 ** 10) }
    profile_photo_url "https://example.com/image.jpg"
    provider_username { "#{Faker::Name.first_name}#{rand(1000)}" }
  end
end

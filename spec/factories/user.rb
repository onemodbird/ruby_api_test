FactoryGirl.define do
  factory :user do
    name { "#{Faker::Name.first_name} #{Faker::Name.last_name}" }
    auth_tokens { [Session.token] }
    email { Faker::Internet.email }
    password { "password" }
  end

  trait :registered do
    password { "password" }
  end

  trait :unregistered do
    password { nil }
  end

  trait :expert do
    roles { ["expert"] }
  end

  trait :facebook do
    facebook_id { SecureRandom.hex(16) }
  end

  trait :google do
    google_id { SecureRandom.hex(16) }
  end

  trait :twitter do
    twitter_id { SecureRandom.hex(16) }
    twitter_username { Faker::Name.first_name }
  end

  trait :with_avatar do
    avatar { File.open(Rails.root.join("spec/fixtures/pixel.png")) }
  end

  trait :with_assignments do
    after(:create) do |user|
      2.times { user.assign(create(:collection, :with_courses)) }
    end
  end

  trait :with_assignment_tasks do
    after(:create) do |user|
      assignment = user.assignments.first
      detail = assignment.detail_for_resource(assignment.assignable.resources[0])
      detail.add_task user, "one", "progress", { input_a1: "Texty McTexterson" }
    end
  end

  trait :with_recent_chats do
    after(:create) do |user|
      user.subscriptions.create!(subscribable: create(:chat))
    end
  end

  trait :with_badge_assertions do
    after(:create) do |user|
      user.badge_assertions.create! badge: create(:badge)
    end
  end

  trait :with_learning_products do
    after(:create) do |user|
      2.times { user.resources.create!(name: Faker::Lorem.sentence, kind: "learning_product") }
    end
  end
end

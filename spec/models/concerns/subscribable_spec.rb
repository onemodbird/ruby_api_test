require "rails_helper"

describe Subscribable do
  let!(:collection) { create :collection, user: user }
  let(:user) { create :user, :registered }

  it "creates a subscription" do
    expect(user.subscriptions.first.subscribable).to eq collection
  end

  it "updates a subscription" do
    now = Timecop.freeze(1.hour)
    collection.subscribe(user)

    expect(user.subscriptions.first.created_at).to be < now
    expect(user.subscriptions.first.updated_at).to eq now
  end

  it "unsubscribes everyone" do
    create_list(:user, 2, :registered).each do |u|
      collab!(collection, u)
    end

    expect(Subscription.count).to eq 3

    collection.destroy
    expect(Subscription.count).to eq 0
  end

  it "lists subscribers" do
    subscriber = create :user
    collection.subscribe(subscriber.id)

    collaborators = create_list(:user, 2, :registered).each do |u|
      collab!(collection, u)
    end

    expect(collection.subscribers).to eq([user, subscriber] + collaborators)
  end

  it "can determine if a user is subscribed" do
    expect(collection.subscriber?(user.id)).to eq(true)
  end
end

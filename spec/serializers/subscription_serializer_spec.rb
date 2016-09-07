require "rails_helper"

describe SubscriptionSerializer do
  let(:user) { create :user }
  def serialized(subscribable)
    sub = Subscription.new(user: user, subscribable: subscribable)
    SubscriptionSerializer.new(sub).serializable_hash
  end

  it "serializes the provided type" do
    expect(serialized(create :user).keys).to eq [:id, :created_at_i, :updated_at_i, :user]
    expect(serialized(create :collection).keys).to eq [:id, :created_at_i, :updated_at_i, :collection]
  end
end

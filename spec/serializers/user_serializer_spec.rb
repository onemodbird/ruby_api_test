require "rails_helper"

describe UserSerializer do
  let(:user) { create :user, :registered }
  let(:serialized) do
    UserSerializer.new(user).serializable_hash
  end
  let(:serialized_for_user) do
    UserSerializer.new(user, { scope: OpenStruct.new(current_user: user) } ).serializable_hash
  end

  it "contains an epoch formatted created_at timestamp" do
    now = Timecop.freeze

    expect(serialized[:created_at]).to eq now.to_i
  end

  it "reports email notifications as enabled by default" do
    expect(serialized_for_user[:email_notifications]).to eq true
  end

  it "reports email notifications as disabled" do
    user.update disabled_communication: ["all"]
    expect(serialized_for_user[:email_notifications]).to eq false
  end

  it "filters private keys" do
    expect(serialized.keys).not_to include(:email, :email_confirmed, :email_notifications, :unread_notifications)
  end

  it "serializes unread notifications counts" do
    create_list(:notification, 2, user: user)
    expect(serialized_for_user[:unread_notifications]).to eq 2
  end

  it "provides subscribed status for embedded users" do
    collection = create(:collection)
    collection.user.subscribe user.id
    serialized = CollectionSerializer.new(collection, scope: OpenStruct.new(current_user: user)).serializable_hash
    expect(serialized[:user][:subscribed]).to eq true
  end
end

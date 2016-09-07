require "rails_helper"

describe AnalyticsService do
  let(:user) { create :user, :registered}
  let(:anonymous_id) { SecureRandom.uuid }

  it "loads a user" do
    Tracking.load(user)
    expect_identify user_id: user.id, traits: { email: user.email }
  end

  it "loads a user async" do
    Tracking.load_async(user.id)
    expect_identify user_id: user.id, traits: { email: user.email }
  end

  it "tracks a user event" do
    data = { x: 1 }
    Tracking.track(:my_event, user: user, data: data)

    expect_tracking(:my_event, user_id: user.id, data: data)
  end

  it "tracks an anonymous event" do
    Tracking.track(:anon, anonymous_id: anonymous_id)
    expect_tracking(:anon, anonymous_id: anonymous_id )
  end

  it "does not track if both user and anonymous_id are absent" do
    expect(Tracking.track("event")).to eq(:not_tracked)
  end
end

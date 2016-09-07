require "rails_helper"

RSpec.describe BadgeRequirement, type: :model do
  let(:user) { create :user }
  let(:badge_requirement) { create :badge_requirement }

  it "tracks analytics for a badge earned" do
    badge_requirement.earn!(user)
    expect_tracking :badge_earned, user_id: user.id

    event_props = get_tracked_event(:badge_earned)[:data][:properties]
    expect(event_props.keys).to include(:resource_id, :resource_name, :badge)
    expect(event_props[:badge]).to include(:name, :image_url)
  end
end

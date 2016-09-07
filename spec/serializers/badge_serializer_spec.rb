require "rails_helper"

describe BadgeSerializer do
  let(:badge) { create :badge }
  let(:serialized) do
    BadgeSerializer.new(badge).serializable_hash
  end

  it "provides a link to the criteria" do
    expect(serialized[:criteria_url]).to_not be_empty
  end
end

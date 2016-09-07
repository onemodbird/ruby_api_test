# require "rails_helper"

describe LearnerSerializer do

  let(:school) { create :school,
    :with_users, :with_admin, :with_assignments, user_count: 2 }
  let(:learner) { school.learners.first }
  let(:admin) { school.admins.first }
  let(:badge) { create :badge }
  let!(:badge_assertion) { create :badge_assertion, user_id: learner.id, badge_id: badge.id}
  let(:serializer) do
    LearnerSerializer.new(learner)
  end
  let(:serialized) { serializer.serializable_hash }

  it "has the right attributes" do
    expected_keys = [:id, :name, :email, :school_ids, :assignments_count, :badge_assertions]
    expect(serialized.keys).to eq(expected_keys)
  end

  it "includes the school's learner." do
    expect(serialized[:id]).to eq school.learners.first.id
  end

  it "produces the correct badge_assertion" do
    expect(serialized[:badge_assertions][0][:user_id]).to eq learner.id
  end

  it "badge inside badge_assertion" do
    expect(serialized[:badge_assertions][0][:badge][:id]).to eq badge.id
  end
end

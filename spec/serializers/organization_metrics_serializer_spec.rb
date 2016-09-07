require "rails_helper"

describe OrganizationMetricsSerializer do
  let(:school) { create :school, :with_users, user_count: 1 }
  def serialize(object, params = {})
    OrganizationMetricsSerializer.serialize(object, params)
  end
  def expect_rollups(data, exlude: [])
    expect(data.keys).to include(
      :learner_count, :badge_assertions_count, :resource_assignments_count)
  end

  context "with an organization hierarchy" do
    let(:state) { create :state }
    let(:district) { create :district, state_id: state.id }
    let!(:school) do
      create :school, :with_users, user_count: 1,
        district_id: district.id, state_id: state.id
    end
    let(:serialized) { serialize(state) }

    it "expects rollups" do
      expect_rollups(serialized)
      expect(serialized[:school_count]).to eq 1
    end

    it "serializes districts" do
      districts = serialized[:districts]

      expect(districts).to match_ids_of [district]
      expect_rollups(districts.first)
    end

    it "serializes schools" do
      schools = serialize(state)[:districts].first[:schools]

      expect(schools).to match_ids_of [school]
      expect_rollups(schools.first)
    end

    context "with a learner" do
      let!(:school) do
        create :school, :with_users, :with_assignments, user_count: 2,
          district_id: district.id, state_id: district.state_id
      end

      it "reports assignments and learners" do
        expect(serialized[:learner_count]).to eq 2
        expect(serialized[:resource_assignments_count]).to eq 10
      end
    end

  end

  it "serializes learners" do
    serialized = serialize(school, learners: true)
    expect(serialized[:learners]).to match_ids_of school.users
    expect(serialized[:learners].first.keys).to include(:badge_assertions, :assignments_count)
  end
end

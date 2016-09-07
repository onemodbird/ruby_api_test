require "rails_helper"

RSpec.describe Organization, type: :model do
  let(:user) { create :user }
  let(:resource) { create :resource }
  let(:nobody) { create :user }

  context "with a school" do
    let(:school) { create :school, :with_users, :with_admin, user_count: 2 }
    let(:admin) { school.admins.first }

    it "lists admins for a school" do
      expect(school.admins.count).to eq 1
    end

    it "reports if a user is an admin" do
      expect(school.is_admin?(admin)).to eq true
      expect(school.is_admin?(school.learners.first)).to eq false
    end

    it "assigns a resource to all learners" do
      school.assign(resource)
      expect(school.assignments.count).to eq 2
      expect(school.assignments.map(&:user)).to match_array school.users
    end

    it "does not duplicate assignments when assigning all" do
      2.times { school.assign(resource) }
      expect(school.assignments.count).to eq 2
    end

    it "assigns a user to a role in the organization" do
      school.add_user(nobody, :learner)
      expect(nobody.reload.organizations).to eq [school]
    end

    it "only assigns a user to an organization once" do
      2.times { school.add_user(nobody, :learner) }
      expect(OrganizationUser.where(user: nobody).count).to eq 1
    end
  end

  context "with an organization hierarchy" do
    let(:state) { create :state}
    let(:district) { create :district, state_id: state.id }
    let!(:school) { create :school, district_id: district.id, state_id: state.id }

    it "returns districts" do
      expect(state.districts.count).to eq 1
      expect(state.districts[0].id).to eq district.id
    end

    it "reports organization administration" do
      state.add_user(user, :admin)

      expect(state.is_admin?(user)).to eq true
      expect(district.is_admin?(user)).to eq true
      expect(school.is_admin?(user)).to eq true
    end

    it "returns schools from states" do
      expect(state.schools).to eq [school]
    end

    it "returns schools from districts" do
      expect(district.schools).to eq [school]
    end

    it "returns descendants" do
      expect(state.descendants).to match_ids_of [district, school]
    end

    it "returns descendants including self" do
      expect(state.descendants(true)).to match_ids_of [state, district, school]
    end

    it "returns assignment counts for myself and descendants" do
      school.add_user(user, :learner)
      create :assignment, user: user

      expect(state.assignments.count).to eq 1
      expect(district.assignments.count).to eq 1
      expect(school.assignments.count).to eq 1
    end
  end
end

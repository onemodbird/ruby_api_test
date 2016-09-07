require "rails_helper"

RSpec.describe OrganizationUser, type: :model do
  let(:user) { create :user }

  context "with organization hierarchy" do
    let(:state) { create :state}
    let(:district) { create :district, state_id: state.id }
    let!(:school) { create :school, district_id: district.id, state_id: state.id }

    it "allows state admins to administer states, districts and schools" do
      state.add_user(user, :admin)

      expect(state.is_admin?(user)).to eq true
      expect(district.is_admin?(user)).to eq true
      expect(school.is_admin?(user)).to eq true
    end

    it "allows district admins to administer districts and schools" do
      district.add_user(user, :admin)

      expect(state.is_admin?(user)).to eq false
      expect(district.is_admin?(user)).to eq true
      expect(school.is_admin?(user)).to eq true
    end

    it "allows school admins to administer only schools" do
      school.add_user(user, :admin)

      expect(state.is_admin?(user)).to eq false
      expect(district.is_admin?(user)).to eq false
      expect(school.is_admin?(user)).to eq true
    end
  end
end

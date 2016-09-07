require "rails_helper"

RSpec.describe OrganizationUser, type: :model do
  it "sets a default role" do
    orguser = create :organization_user
    expect(orguser.role).to eq "learner"
  end
end

require "rails_helper"

describe Collaboratable do
  let(:collaboration) { create :collaboration, :pending_user }
  let(:collaboratable) { collaboration.collaboratable.reload }

  it "only includes active collaborations in collaborators" do
    expect(collaboratable.collaborations.size).to eq(1)
    expect(collaboratable.collaborations.first.status).not_to eq("active")
    expect(collaboratable.collaborators.size).to eq(0)
  end
end

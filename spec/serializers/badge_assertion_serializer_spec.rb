require "rails_helper"

describe BadgeAssertionSerializer do
  let(:assertion) { create :badge_assertion }
  let(:artifact) { create :resource }
  let(:serialized) do
    BadgeAssertionSerializer.new(assertion).serializable_hash
  end

  it "provides the evidence url for evidence" do
    assertion.evidence_url = "google.com"
    expect(serialized[:evidence_url]).to eq "google.com"
  end

  it "provides the artifact url for evidence" do
    assertion.artifact = artifact
    expect(serialized[:evidence_url]).to eq artifact.link
  end

  it "returns the site url for evidence" do
    expect(serialized[:evidence_url]).to eq Secrets.site_url
  end
end

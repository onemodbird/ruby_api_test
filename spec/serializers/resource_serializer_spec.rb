require "rails_helper"

describe ResourceSerializer do
  def serialized(resource)
    ResourceSerializer.serialize(resource)
  end

  context "with pd resource" do
    let(:resource) { create :resource, :course, content_block_count: 2 }

    it "serializes content blocks" do
      blocks = serialized(resource)[:content_blocks]
      expect(blocks.count).to eq 2
      expect(blocks[0].keys).to include(:kind, :title, :position)
    end
  end

  context "with vif resource" do
    let(:resource) { create :resource, :vif }

    it "groups as vif" do
      expect(serialized(resource)[:groups]).to include("vif")
    end
  end

  context "author" do
    let(:vif_resource) { create :resource, :vif }
    let(:expert_resource) { create(:review, :expert).resource }
    let(:community_resource) { create :resource }

    it "author is vif" do
      expect(serialized(vif_resource)[:author]).to eq("vif")
    end

    it "author is expert" do
      expert_resource.user = create :user, :expert
      expect(serialized(expert_resource)[:author]).to eq("expert")
    end

    it "author is community" do
      expect(serialized(community_resource)[:author]).to eq("community")
    end
  end
end

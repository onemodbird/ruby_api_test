require "rails_helper"

RSpec.describe FeaturedCollectionGroup, type: :model do

  it "has required fields" do
    required_fields = [:collection_group_id, :position, :visible]
    featured = FeaturedCollectionGroup.new(position: nil, visible: nil)
    featured.valid?

    expect(featured.errors.keys).to eq(required_fields)
  end

  it "excludes non-visible" do
    fcg = create :featured_collection_group, visible: true
    fcg2 = create :featured_collection_group

    fcgs = FeaturedCollectionGroup.for_display

    expect(fcgs.size).to eq(1)
    expect(fcgs.first).to eq(fcg)
  end

end

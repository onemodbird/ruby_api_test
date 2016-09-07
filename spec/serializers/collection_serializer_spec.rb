require "rails_helper"

describe CollectionSerializer do
  def collection(params = {})
    assign_resources(create(:collection, params), [resource1, resource2])
  end

  let(:resource1) { create :resource, grade_levels: %w(1st 2nd 3rd) }
  let(:resource2) { create :resource, grade_levels: %w(K 1st) }
  let(:serialized) do
    CollectionSerializer.new(collection).serializable_hash
  end

  it "defaults to the grade levels of the resources" do
    serialized = CollectionSerializer.new(collection).serializable_hash

    expect(serialized[:grade_levels]) =~ %w(K 1st 2nd 3rd)
  end

  it "Overrides grade levels with name of collection" do
    collection = collection(name: "The best things for 4th Grade")

    serialized = CollectionSerializer.new(collection).serializable_hash
    expect(serialized[:grade_levels]) =~ %w(4th)
  end
end

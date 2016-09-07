require "rails_helper"

RSpec.describe Assignment, type: :model do
  let(:user) { create :user}
  let(:other) { create :user }
  let(:assignment) { create :assignment, user: user }
  let(:collection) { create :collection }
  let(:resource) { assignment.assignable.resources.first }

  it "allows a user access to an assigned resource" do
    expect(resource.is_assigned_to?(user)) == true
  end

  it "does not allow a user access to an unassigned resource" do
    expect(resource.is_assigned_to?(other)) == false
  end

  it "assigns a user preview collection on creation" do
    collection.update_attributes(flags: { "preview" => true })

    expect(user.assignments.count).to eq 1
    expect(user.assignments.first.assignable).to eq collection
  end

  describe "#assign" do
    let!(:collection) { create :collection, visibility: "protected" }
    let!(:cet_collection) do
      create :collection,
             name: collection.name,
             visibility: "protected",
             flags: { cet: true }
    end

    it "assings a user to a non-cet collection" do
      cet = false
      Assignment.assign(user.email, collection.name, cet)

      expect(user.assignments.first.assignable).to eq(collection)
    end

    it "assings a user to a cet collection" do
      cet = true
      Assignment.assign(user.email, collection.name, cet)

      expect(user.assignments.first.assignable).to eq(cet_collection)
    end

    it "assigns multiple collections" do
      other_collection = create :collection, visibility: "protected"
      collections = [ collection, other_collection ].sort

      Assignment.assign(user.email, collections.map(&:name), false)
      expect(user.assignments.map(&:assignable).sort).to eq(collections)
    end
  end
end

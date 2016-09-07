require "rails_helper"

describe ChangeLoggable do
  let(:user) { create :user, :registered }
  let(:collection) { create :collection, tags: %w(one two) }
  let(:resources) { create_list :resource, 2 }

  it "logs no changes" do
    collection.update(name: "New name")
    expect(collection.change_logs).to be_empty
  end

  it "logs changes for name" do
    collection.update(changed_by: user.id, name: "New name")

    expect(collection.change_logs.count).to eq 1
    expect(collection.change_logs.last.user).to eq user
    expect(collection.change_logs.last.change).to eq "name updated"
  end

  it "logs changed for name, description, visibility, and tags" do
    collection.update(changed_by: user.id, name: "New name",
      visibility: "private", description: "New desc")

    expect(collection.change_logs.count).to eq 3
    expect(collection.change_logs.pluck(:change)).to match_array(
      %w(name visibility description).map{ |att| "#{att} updated"})
  end

  it "logs changed tags" do
    collection.update(changed_by: user.id, tags: %w(two three))

    expect(collection.change_logs.count).to eq 2
    expect(collection.change_logs.pluck(:change)).to match_array([
      "tag 'one' removed",
      "tag 'three' added"
    ])
  end
end

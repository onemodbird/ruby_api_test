require "rails_helper"

describe BaseSerializer do
  it "produces a list of serialized hashes" do
    resources = create_list :resource, 2
    serialized = ResourceSerializer.list(resources)

    expect(serialized.count).to eq 2
    expect(serialized.first).to have_key :kind
  end
end

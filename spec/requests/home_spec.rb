require "rails_helper"

describe Appo::Api::Home do

  it "has the correct keys" do
    expected_keys = %w(
      subjects
      suggested_searches
      grade_levels
      collections
      collection_groups
    )

    get "/v1/home"

    expect(json_response.keys).to eq(expected_keys)
  end

  it "includes collection groups that are featured" do
    fcg = create :featured_collection_group, visible: true

    get "/v1/home"

    collection_group = json_response.fetch("collection_groups").first
    expect(collection_group.fetch("id")).to eq(fcg.collection_group.id)
  end

  it "sends a notification for unhandled exceptions" do
    expect(ErrorNotification).to receive(:notify)
    expect(KeyValue).to receive(:suggested_searches).and_raise
    get "/v1/home"
  end
end

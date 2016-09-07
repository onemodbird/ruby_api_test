require "rails_helper"

describe Appo::Api::Searches do


  def use *args
    # the arguments to use should be defined in let blocks which will
    # create the collections, then we import and refresh to make sure all
    # are available to search
    Collection.create_index!
    Collection.import
    Collection.refresh_index!
  end

  def expect_collection_ids(expected_ids)
    ids = json_response!.fetch("collections").map { |c| c.fetch("id") }
    expect(ids).to match_array(expected_ids)
  end

  let(:user) { create :user, :registered }

  [ :collection1, :collection2, :collection3 ].each_with_index do |c, i|
    let(c) do
      resources = (1..5).map { |j| create(:resource, url: "https://url.com/#{i}-#{j}") }
      assign_resources(create(:collection, name: "collection#{i}"), resources)
    end
  end

  it "includes collections" do
    use collection1

    get "/v1/search", q: collection1.name

    expect_response_code_of(200)
    expect_collection_ids(*collection1.id)
  end

  it "paginates collections" do
    use collection1, collection2, collection3

    get "/v1/search"
    expect(json_response.fetch("collections").size).to eq(2)

    get "/v1/search", page: 2
    expect(json_response!.fetch("collections").size).to eq(1)
  end

  it "filters collections by price, type, and grade" do
    resources = [
      create(:resource, :video),
      create(:resource, :ios_app),
      create(:resource, :ios_app, grade_levels: %w(1st)),
      create(:resource, :ios_app, grade_levels: %w(1st), price: "$1.99")
    ]

    collections = resources.map do |resource|
      assign_resources(create(:collection, user: user), resource)
    end
    use collections

    stub_const("Appo::Api::Searches::COLLECTIONS_PER_PAGE", 10)
    stub_const("Appo::Api::Searches::COLLECTIONS_MIN_RESOURCES_COUNT", 0)

    get "/v1/search"
    expect_collection_ids(collections.map(&:id))

    get "/v1/search", types: "ios-app"
    expect_collection_ids(collections.drop(1).map(&:id))

    get "/v1/search", types: "ios-app", grades: "1st"
    expect_collection_ids(collections.drop(2).map(&:id))

    get "/v1/search", type: "ios-app", grades: "1st", prices: "paid"
    expect_collection_ids(collections.drop(3).map(&:id))
  end

  it "filters collections by author and types: activity, unit, lesson-plan" do
    resources = [
      create(:resource),
      create(:review, :expert).resource,
      create(:resource, :vif, kind: "activity"),
      create(:resource, :vif, kind: "unit"),
      create(:resource, :vif, kind: "learning_product"),
    ]

    collections = resources.map do |resource|
      assign_resources(create(:collection, user: user), resource)
    end
    use collections

    stub_const("Appo::Api::Searches::COLLECTIONS_PER_PAGE", 10)
    stub_const("Appo::Api::Searches::COLLECTIONS_MIN_RESOURCES_COUNT", 0)

    get "/v1/search"
    expect_collection_ids(collections.map(&:id))

    get "/v1/search", authors: "community"
    expect_collection_ids(Array(collections[0]).map(&:id))

    get "/v1/search", authors: "expert"
    expect_collection_ids(Array(collections[1]).map(&:id))

    get "/v1/search", authors: "vif"
    expect_collection_ids(collections.drop(2).map(&:id))

    get "/v1/search", authors: "vif", types: "activity"
    expect_collection_ids(Array(collections[2]).map(&:id))

    get "/v1/search", authors: "vif", types: "unit"
    expect_collection_ids(Array(collections[3]).map(&:id))

    get "/v1/search", authors: "vif", types: "lesson-plan"
    expect_collection_ids(Array(collections[4]).map(&:id))
  end

  it "filters for common core via preprocessing" do
    common_core_tag = "CCSS.Math.Content.4.NBT.A.1"
    resources = [
      create(:resource),
      create(:resource, common_core_tags: [common_core_tag])
    ]

    collections = resources.map do |resource|
      assign_resources(create(:collection, user: user), resource)
    end
    use collections

    stub_const("Appo::Api::Searches::COLLECTIONS_MIN_RESOURCES_COUNT", 0)

    get "/v1/search", q: common_core_tag
    expect_collection_ids(*collections.last.id)
  end

  it "includes counts with proper keys" do
    get "/v1/search", q: ""

    expected_counts_keys =
      Appo::Search::Params
        .constants
        .map(&:to_s)
        .map(&:downcase)
        .push("total")
        .sort

    counts = json_response.fetch("counts")
    expect(counts.keys.sort).to eq(expected_counts_keys)

    authors = counts.fetch("authors")
    expect(authors.keys).to eq(Appo::Search::Params::AUTHORS)

    types = counts.fetch("types")
    expect(types.keys).to eq(Appo::Search::Params::TYPES)

    types = counts.fetch("grades")
    expect(types.keys).to eq(Appo::Search::Params::GRADES)

    types = counts.fetch("prices")
    expect(types.keys).to eq(Appo::Search::Params::PRICES)

    types = counts.fetch("groups")
    expect(types.keys).to eq(Appo::Search::Params::GROUPS)
  end

  it "allows q param to be optional" do
    get "/v1/search"
    expect_response_code_of 200
  end

  it "allows a collection name to override resource grade levels" do
    resources = [
      create(:resource, grade_levels: %w(1st)),
      create(:resource, grade_levels: %w(5th))
    ]

    collection = assign_resources(create(:collection, name: "Ninth grade stuff!", user: user), resources)
    use collection
    stub_const("Appo::Api::Searches::COLLECTIONS_MIN_RESOURCES_COUNT", 0)

    get "/v1/search?grades=9th"
    expect_collection_ids([collection.id])
  end

end

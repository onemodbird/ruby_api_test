require 'rails_helper'

describe Resource do
  let(:resource) { create :resource }

  def index_mapping(field)
    Resource
      .mappings
      .to_hash
      .fetch(:resource)
      .fetch(:properties)
      .fetch(field)
  end

  it "tracks a resource creation" do
    expect_tracking :resource_create, anonymous_id: Appo::Constants::NIL_UUID,
      data: {
        resource_id: resource.id,
        name: resource.name,
        kind: resource.kind }
  end

  it "fills in gaps between assigned grade levels" do
    resource = Resource.new(grade_levels: %w(1st 5th))
    expect(resource.combined_grade_levels).to eq(%w(1st 2nd 3rd 4th 5th))
  end

  it "rewrites v.aimg.us HTTP urls to d31n1bk1ay3f1h.cloudfront.net HTTPS" do
    http_url = 'http://v.aimg.us/app/icon.png'
    https_url = 'https://d31n1bk1ay3f1h.cloudfront.net/app/icon.png'

    resource = Resource.new(image_url: http_url)

    expect(resource.image_url).to eq(https_url)
    expect(resource.as_indexed_json.fetch(:image_url)).to eq(https_url)
  end

  it "rewrites i.vimeocdn.com HTTP urls to HTTPS" do
    http_url = 'http://i.vimeocdn.com/video/469111294_640.jpg'
    https_url = 'https://i.vimeocdn.com/video/469111294_640.jpg'

    resource = Resource.new(image_url: http_url)

    expect(resource.image_url).to eq(https_url)
    expect(resource.as_indexed_json.fetch(:image_url)).to eq(https_url)
  end

  it "calculates score and community_score separately" do
    expert_review = {
      'expert' => true,
      'content_score' => 5.5,
      'feature_score' => 5.5,
      'engagement_score' => 5.5,
      'total_score' => 5.5
    }

    non_expert_review = {
      'expert' => false,
      'content_score' => 4.4,
      'feature_score' => 4.4,
      'engagement_score' => 4.4,
      'total_score' => 4.4
    }

    resource = Resource.new(reviews: [
      expert_review,
      non_expert_review
    ])
    expect(resource.score).to eq(5.5)
    expect(resource.community_score).to eq(4.4)
  end


  describe 'kind' do

    describe '.kind' do
      it 'can find resources by kind (part 1)' do
        expect(Resource).to receive(:where).with(kind: 'app')
        Resource.kind('app')
      end

      it 'can find resources by kind (part 2)' do
        resource = Resource.create!(kind: 'webpage', url: 'https://url')
        expect(Resource.kind('webpage').first).to eq(resource)
      end
    end

  end


  describe "elasticesearch indexing" do
    it "maps visibility as not_analyzed string" do
      visibility = index_mapping(:visibility)
      expect(visibility.fetch(:type)).to eq('string')
      expect(visibility.fetch(:index)).to eq('not_analyzed')
    end

    it "includes visibility in indexed json" do
      r = Resource.new(visibility: 'hidden')
      expect(r.as_indexed_json.fetch(:visibility)).to eq('hidden')
    end

    it "indexes author" do
      author_mapping = index_mapping(:author)
      expect(author_mapping.fetch(:type)).to eq("string")
      expect(author_mapping.fetch(:index)).to eq("not_analyzed")
    end
  end

  it "handles default visibility for all values of kind" do
    expect {
      Resource::KINDS.each do |kind|
        Resource.new(kind: kind)
      end
    }.to_not raise_error
  end

  it "sets correct default visibility values" do
    expect(Resource.new.visibility).to eq("undefined")

    ["undefined", nil].each do |kind|
      expect(Resource.new(kind: kind).visibility).to eq("undefined")
    end

    %w( activity
        artifact
        file
        learning_product
        unit
        video_channel
        webpage
    ).each do |kind|
      expect(Resource.new(kind: kind).visibility).to eq("private")
    end

    %w(app video ibook).each do |kind|
      expect(Resource.new(kind: kind).visibility).to eq("public")
    end

    expect(Resource.new(kind: "course").visibility).to eq("protected")

    expect{ Resource.new(kind: "bogus") }.to(
      raise_error(/unhandled default visibility/i)
    )
  end

  it "doesn't override existing visibility values" do
    resource = Resource.new(visibility: 'hidden')
    resource.kind = 'app'
    expect(resource.visibility).to eq('hidden')
  end

  it "returns 'trending' resources" do
    resources = create_list :resource, 10
    create_list :chat_resource, 3, resource: resources[0]
    create_list :chat_resource, 2, resource: resources[1]
    create_list :chat_resource, 1, resource: resources[2]

    expect(Resource.trending).to eq [resources[0], resources[1], resources[2]]
  end

  it "provides the link for a course if url is unset" do
    Resource::KINDS_WITHOUT_URLS.each do |kind|
      resource = create(:resource, url: nil, kind: kind)
      expect(resource.url).to eq resource.link
    end
  end

  it "provides the url if set" do
    resource = create(:resource, url: "http://wherever.com")
    expect(resource.url).to eq "http://wherever.com"
  end

  describe "VIF created resources" do
    it "is vif when authored by VIF" do
      vif_author_hash =
        {"id" => 26, "name" => "Authored By", "value" => "VIF"}
      imported_data = { "extra_fields" => [ vif_author_hash ]}
      resource = create :resource, imported_data: imported_data

      expect(resource.imported_data["extra_fields"]).to include(vif_author_hash)
      expect(resource.vif?).to eq(true)
    end

    it "is vif when imported_data.created_by == 943" do
      imported_data = { created_by: 943 }
      resource = create :resource, imported_data: imported_data

      expect(resource.vif?).to eq(true)
    end

    #it "is vif when user is ce111674-5fac-4718-ac28-787addd42261" do
    #  user = create :user, id: "ce111674-5fac-4718-ac28-787addd42261"
    #  resource = create :resource, user: user

    #  expect(resource.vif?).to eq(true)
    #end

    #it "is vif when user is f1b66ab2-cf0d-446c-a6f0-86540ef0ae8e" do
    #  user = create :user, id: "f1b66ab2-cf0d-446c-a6f0-86540ef0ae8e"
    #  resource = create :resource, user: user

    #  expect(resource.vif?).to eq(true)
    #end
  end
end

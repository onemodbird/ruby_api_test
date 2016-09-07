require 'rails_helper'

module Appo
module Search

describe ResourceSearchAPI do

  it "paginates" do
    query = 'q'
    page = 2
    search_proxy = double( :page => double(:per => nil) )

    expect(Resource).to receive(:search).and_return(search_proxy)
    expect(search_proxy).to receive(:page).with(page)

    ResourceSearchAPI.search(q: query, page: 2)
  end


  context "grade level filter" do
    it "builds a grade level filter" do
      grades = %w(Pre-K, K, 12th)
      api = ResourceSearchAPI.new(grades: grades)

      expect(api.send(:grade_level_filter)).to eq(
        { terms: { grade_levels: grades } }
      )
    end

    it "includes the grade level filter in query" do
      api = ResourceSearchAPI.new

      expect(api).to receive(:grade_level_filter).at_least(:once)

      api.send(:elasticsearch_query)
    end

    it "doesn't apply grade level filter if grade_levels is empty" do
      api = ResourceSearchAPI.new
      expect(api.send(:grade_level_filter)).to eq(nil)
    end
  end


  context "indexing behavior" do

    before(:each) do
      Resource.create_index!
    end

    def use *args
      # the arguments to use should be defined in let blocks which will
      # create the resources, then we import and refresh to make sure all
      # are available to search
      Resource.import
      Resource.refresh_index!
    end

    let(:ibook_free) {
      create :resource, :ibook, name: "ibook", tags: %w(rsrc ibook)
    }

    let(:ibook_paid) {
      create :resource, :ibook,
             name: "ibook 2",
             tags: %w(rsrc ibook),
             price: "$8.99"
    }

    let(:ios_free) {
      create :resource, :ios_app, name: "ios", tags: %w(rsrc ios)
    }

    let(:ios_paid) {
      create :resource, :ios_app,
            name: "ios 2",
            tags: %w(rsrc ios),
            price: "$1.99"
    }

    let(:android_free) {
      create :resource, :android_app, name: "android", tags: %w(rsrc android)
    }

    let(:android_paid) {
      create :resource, :android_app,
             name: "android 2",
             tags: %w(rsrc android),
             price: "$0.99"
    }

    let(:video) {
      create :resource, :video, name: "youtube", tags: %w(rsrc youtube)
    }

    let(:video_7th_grade) {
      create :resource, :video,
             name: "youtube",
             tags: %w(rsrc youtube),
             grade_levels: %w(7th)
    }

    let(:webpage) {
      create :resource,
<<<<<<< HEAD
             url: "https://www.greenprintmedia.org/",
             name: "greenprint",
             tags: %w(rsrc greenprint),
=======
             url: "https://www.participate.com/",
             name: "participate",
             tags: %w(rsrc participate),
>>>>>>> parent of 0bd3464... customize to greenprintmedia
             visibility: "public"
    }

    let(:webpage_defunct) {
      create :resource,
             url: "http://www.appvee.com/",
             name: "appvee",
             tags: %w(rsrc appvee),
             defunct_at: Time.zone.now
    }

    let(:webpage_private) {
      create :resource,
             url: "http://www.androidapps.com/",
             name: "androidapps",
             tags: %w(rsrc androidapps),
             visibility: "private"
    }

    let(:webpage_protected) {
      create :resource,
             url: "https://protected.example.com/",
             name: "protected",
             tags: %w(rsrc protected),
             visibility: "protected"
    }

    let(:webpage_hidden) {
      create :resource,
             url: "http://www.appolicious.com/",
             name: "appolicious",
             tags: %w(rsrc appolicious),
             visibility: "hidden"
    }

    let(:vif_authored) {
      create :resource,
             :vif,
             name: "author",
             tags: %w(author),
             visibility: "public"
    }

    let(:expert_authored) {
      resource = create(:review, :expert, :score_30).resource
      resource.update!(name: "author", tags: %w(author), visibility: "public")
      resource
    }

    let(:community_authored) {
      webpage.update!(name: "author", tags: %w(author))
      webpage
    }

    let(:authored) {
      [ vif_authored, expert_authored, community_authored ]
    }

    let(:basics) {
      [
        ios_free, ios_paid,
        android_free, android_paid,
        video, webpage, webpage_protected,
        ibook_free, ibook_paid
      ]
    }

    describe "boosting" do
      let!(:index!) { use authored }

      it "has top-to-bottom score order of vif,expert,community" do
        expect(expert_authored.score).to eq(30)

        response = ResourceSearchAPI.search()

        result_ids = response.results.map{|r| r.fetch("id") }
        expected_ids =
          [ vif_authored.id, expert_authored.id, community_authored.id ]

        expect(result_ids).to eq(expected_ids)
      end

    end

    describe "author filter" do
      let!(:index!) { use authored }

      it "gets 'em all" do
        response = ResourceSearchAPI.search(q: 'author')
        expect(response.results.size).to eq(3)
      end

      it "filters for vif" do
        response = ResourceSearchAPI.search(q: 'author', authors: ["vif"])
        expect(response.results.size).to eq(1)
        expect(response.results.first["id"]).to eq(vif_authored.id)
      end

      it "filters for expert" do
        response = ResourceSearchAPI.search(q: 'author', authors: ["expert"])
        expect(response.results.size).to eq(1)
        expect(response.results.first["id"]).to eq(expert_authored.id)
      end

      it "filters for community" do
        response = ResourceSearchAPI.search(q: 'author', authors: ["community"])
        expect(response.results.size).to eq(1)
        expect(response.results.first["id"]).to eq(community_authored.id)
      end
    end

    it "has correct counts for non-defunct, non-grade-filtered" do
      use basics
      response = ResourceSearchAPI.search(q: 'rsrc')
      expect(response.total_count).to eq(8)
      expect(response.paid_count).to eq(3)
      expect(response.free_count).to eq(5)
      expect(response.ios_count).to eq(2)
      expect(response.android_count).to eq(2)
      expect(response.video_count).to eq(1)
      expect(response.webpage_count).to eq(1)
      expect(response.ibook_count).to eq(2)
    end

    it "changes type counts when price filter is applied" do
      use basics
      response = ResourceSearchAPI.search(q: 'rsrc', prices: ['paid'])
      expect(response.total_count).to eq(3)
      expect(response.paid_count).to eq(3)
      expect(response.free_count).to eq(5)
      expect(response.ios_count).to eq(1)
      expect(response.android_count).to eq(1)
      expect(response.video_count).to eq(0)
      expect(response.webpage_count).to eq(0)
      expect(response.ibook_count).to eq(1)
    end

    it "changes price counts when type filter is applied" do
      use basics
      response = ResourceSearchAPI.search(q: 'rsrc', types: ['ios-app'])
      expect(response.total_count).to eq(2)
      expect(response.paid_count).to eq(1)
      expect(response.free_count).to eq(1)
      expect(response.ios_count).to eq(2)
      expect(response.android_count).to eq(2)
      expect(response.video_count).to eq(1)
      expect(response.webpage_count).to eq(1)
      expect(response.ibook_count).to eq(2)
    end

    it "doesn't count defunct resources" do
      use webpage_defunct
      response = ResourceSearchAPI.search(q: 'rsrc')
      expect(response.total_count).to eq(0)
      expect(response.free_count).to eq(0)
      expect(response.webpage_count).to eq(0)
    end

    it "excludes private and hidden resources" do
      use webpage, webpage_private, webpage_hidden
      response = ResourceSearchAPI.search(q: 'rsrc')
      expect(response.results.size).to eq(1)
      expect(response.results.first.fetch('id')).to eq(webpage.id)
      expect(response.total_count).to eq(1)
      expect(response.free_count).to eq(1)
      expect(response.webpage_count).to eq(1)
    end

    it "doesn't count grade-filtered resources" do
      webpage.update_attributes!(grade_levels: %w(8th))
      use webpage, video, video_7th_grade
      response = ResourceSearchAPI.search(q: '7th grade rsrc')
      expect(response.total_count).to eq(1)
      expect(response.free_count).to eq(1)
      expect(response.video_count).to eq(1)
      expect(response.webpage_count).to eq(0)
    end

    it "aggregates correctly given multiple values for a single field" do
      webpage.update_attributes!(grade_levels: %w(8th 9th))
      use webpage
      response = ResourceSearchAPI.search(q: '8th grade and 9th grade rsrc')
      expect(response.total_count).to eq(1)
      expect(response.free_count).to eq(1)
      expect(response.webpage_count).to eq(1)
    end

    it "filters by common core tag" do
      common_core_tag = 'CCSS.Math.Content.4.NBT.A.1'
      ios_free.update_attributes!(common_core_tags: [common_core_tag])
      ios_paid.update_attributes!(name: common_core_tag)
      use basics
      response = ResourceSearchAPI.search(q: common_core_tag)
      expect(response.results.size).to eq(1)
      expect(response.results.first.fetch('id')).to eq(ios_free.id)
    end

    it "aggregates correctly when filtering by common core" do
      common_core_tag = 'CCSS.Math.Content.4.NBT.A.1'
      ios_free.update_attributes!(common_core_tags: [common_core_tag])
      ios_paid.update_attributes!(name: common_core_tag)
      use basics
      response = ResourceSearchAPI.search(q: common_core_tag)
      expect(response.total_count).to eq(1)
      expect(response.paid_count).to eq(0)
      expect(response.free_count).to eq(1)
      expect(response.ios_count).to eq(1)
      expect(response.android_count).to eq(0)
      expect(response.video_count).to eq(0)
      expect(response.webpage_count).to eq(0)
      expect(response.ibook_count).to eq(0)
    end

    it "aggregates correctly when filtering by common core and grade" do
      common_core_tag = 'CCSS.Math.Content.4.NBT.A.1'
      grade_level = '4th'
      query = "#{common_core_tag} #{grade_level} grade rsrc"

      ios_free.update_attributes!(common_core_tags: [common_core_tag])
      webpage.update_attributes!(grade_levels: [grade_level])
      video.update_attributes!(
        common_core_tags: [common_core_tag],
        grade_levels: [grade_level]
      )

      use basics
      response = ResourceSearchAPI.search(q: query)

      expect(response.total_count).to eq(1)
      expect(response.paid_count).to eq(0)
      expect(response.free_count).to eq(1)
      expect(response.ios_count).to eq(0)
      expect(response.android_count).to eq(0)
      expect(response.video_count).to eq(1)
      expect(response.webpage_count).to eq(0)
      expect(response.ibook_count).to eq(0)
    end

    it "aggregates correctly with grade level filtering" do
      webpage.update_attributes(grade_levels: %w(1st))
      use basics, video_7th_grade
      response = ResourceSearchAPI.search(grades: %(7th))

      expect(response.total_count).to eq(1)

      expect(response.price_counts).to eq(
        {
          "free" => 1,
          "paid" => 0
        }
      )

      expect(response.content_type_counts).to eq(
        {
          "ios-app" => 0,
          "android-app" => 0,
          "video" => 1,
          "webpage" => 0,
          "ibook" => 0,
          "activity" => 0,
          "lesson-plan" => 0,
          "unit" => 0,
        }
      )

      expect(response.grade_level_counts).to eq(
        {
          "Pre-K" => 0,
          "K"     => 0,
          "1st"   => 1,
          "2nd"   => 0,
          "3rd"   => 0,
          "4th"   => 0,
          "5th"   => 0,
          "6th"   => 0,
          "7th"   => 1,
          "8th"   => 0,
          "9th"   => 0,
          "10th"  => 0,
          "11th"  => 0,
          "12th"  => 0
        }
      )
    end

    it "returns imovie for 'imovie for ipad' saerch" do
      ios_free.update_attributes(name: "iMovie")
      use ios_free

      response = ResourceSearchAPI.search(q: "imovie for ipad")
      expect(response.results.first.fetch("id")).to eq(ios_free.id)
    end

    describe "stopwords" do
      let(:stopwords) { %w(a an and as for in of the to with) }
      let(:resource) { create :resource, :webpage, name: stopwords.join(" ") }

      it "retains stopwords for exact name match" do
        use resource
        response = ResourceSearchAPI.search(q: stopwords.join(" "))
        expect(response.total_count).to eq(1)
      end

      it "removes stopwords when tokenizing" do
        use resource
        response = ResourceSearchAPI.search(q: stopwords.shuffle.join(" "))
        expect(response.total_count).to eq(0)
      end
    end
  end

end

end
end

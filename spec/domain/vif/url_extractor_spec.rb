require "spec_helper"

module Vif
  describe UrlExtractor do
    let(:link_url) { Faker::Internet.url }
    let(:image_url) { Faker::Internet.url }

    it "extracts urls from href attributes" do
      html = %(<a href="#{link_url}">click</a>)
      extracted = UrlExtractor.extract(html)
      expected = [[ "a.href", link_url ]]

      expect(extracted).to eq(expected)
    end

    it "extracts urls from src attributes" do
      html = %(<img src="#{image_url}">)
      extracted = UrlExtractor.extract(html)
      expected = [[ "img.src", image_url ]]

      expect(extracted).to eq(expected)
    end

    it "extracts from nested elements" do
      html = %(<div><ul><li><p><img src="#{image_url}"></p></li></ul></div>)
      extracted = UrlExtractor.extract(html)
      expected = [[ "img.src", image_url ]]

      expect(extracted).to eq(expected)
    end

    it "extracts multiple urls" do
      html = %(<a href="#{link_url}">link</a><img src="#{image_url}">)
      extracted = UrlExtractor.extract(html)
      expected = [
        [ "a.href", link_url ],
        [ "img.src", image_url ],
      ]

      expect(extracted).to eq(expected)
    end

    it "extracts nested urls" do
      html = %(<a href="#{link_url}"><img src="#{image_url}"></a>)
      extracted = UrlExtractor.extract(html)
      expected = [
        [ "a.href", link_url ],
        [ "img.src", image_url ],
      ]

      expect(extracted).to eq(expected)
    end
  end
end

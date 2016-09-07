require "spec_helper"
require "addressable/uri"
require_relative "../../../app/domain/appo/resource_kind"

module Appo
  describe ResourceKind do
    describe ".kind" do

      kind_urls_mapping = {
        app: %w(
          https://itunes.apple.com/app/id343200656
          https://itunes.apple.com/us/app/angry-birds/id343200656?mt=8
          https://play.google.com/store/apps/details?id=com.topps.force
        ),
        ibook: %w(
          https://itunes.apple.com/us/book/superfreakonomics/id360642589?mt=11
          https://itunes.apple.com/us/book/email/id743560201?mt=13
          https://itunes.apple.com/book/id360642589
        ),
        file: %w(
          https://s3.amazonaws.com/com.appolearning.files/some.file
        ),
        video: %w(
          https://vimeo.com/8906362
          https://www.youtube.com/watch?v=kWOAHIpmLAI
        ),
        webpage: %w(
          https://itunes.apple.com/us/itunes-u/game-theory-video/id341651977?mt=10
          https://play.google.com/store/books/details/The_Martian?id=MQeHAAAAQBAJ
          https://play.google.com/store/newsstand/details/TIME_Magazine?id=CAowmLqFAg
          https://www.youtube.com/channel/UCbn1OgGei-DV7aSRo_HaAiw
          https://www.youtube.com/playlist?list=PLE7tQUdRKcyYBz6MFMQdRGPXMg3iO6Hpa
          https://www.youtube.com/user/Confreaks
          https://vimeo.com/channels/584142
          https://vimeo.com/album/2831260
          https://vimeo.com/groups/computerscience
          https://vimeo.com/wonderworkshopfilms
          https://s3.amazonaws.com/some.bucket/some.file
          https://www.nasa.gov/
        )
      }

      kind_urls_mapping.each do |kind, urls|
        describe "#{kind} URLs" do
          urls.each do |url|
            it "resolves #{url} to #{kind}" do
              expect(ResourceKind.kind(url)).to eq(kind.to_s)
            end
          end
        end
      end

      it "gets app_store_ids" do
        app_ids = kind_urls_mapping[:app].map{ |url| ResourceKind.app_store_id(url) }
        expect(app_ids).to eq ["343200656", "343200656", "com.topps.force"]
      end

      it "gets operating systems" do
        osses = kind_urls_mapping[:app].map{ |url| ResourceKind.os(url) }
        expect(osses).to eq ["ios", "ios", "android"]
      end
    end
  end
end

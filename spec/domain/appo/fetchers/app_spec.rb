require "rails_helper"

module Appo
  module Fetchers
    describe App do
      let(:id) { "1234" }
      let(:url) { "https://itunes.apple.com/us/app/itsanapp/id#{id}?mt=8" }
      let(:fetcher) { App.new(url) }
      let(:empty_json) do
        %[{
            "resultCount":0,
            "results": []
        }]
      end

      def response_json(price = "Free")
        %[{
            "resultCount":1,
            "results":[
              {
                "screenshotUrls":[
                  "http://cdn.com/shot1_320.jpg",
                  "http://cdn.com/shot2_320.jpg"
                ],
                "ipadScreenshotUrls":[
                  "http://cdn.com/shot1_480.jpg",
                  "http://cdn.com/shot2_480.jpg"
                ],
                "artworkUrl512":"http://cdn.com/artwork_512.jpg",
                "formattedPrice": "#{price}",
                "trackName":"Application Name",
                "sellerName":"Company LLC",
                "description":"This is an app description"
              }
            ]
          }]
      end

      def mock_response(response)
        stub_request(:get, /https:\/\/itunes.apple.com\/lookup\?id=\d+$/)
          .to_return(status: 200, body: response)
      end

      it "extracts the id from the url" do
        expect(fetcher.instance_variable_get(:@id)).to eq(id)
      end

      describe "#resource_data" do
        it "returns a defunct_at timestamp if the app is not found" do
          Timecop.freeze and mock_response(empty_json)
          expect(fetcher.resource_data).to eq(defunct_at: Time.now.utc )
        end

        it "returns the correct hash of data" do
          mock_response(response_json)
          expect(fetcher.resource_data).to eq(
            defunct_at: nil,
            description: "This is an app description",
            image_url: "#{Appo::Constants::CDN_URL}i/200/http://cdn.com/artwork_512.jpg",
            name: "Application Name",
            owner: "Company LLC",
            price: "Free",
            screenshot_urls: [
              "#{Appo::Constants::CDN_URL}s/1024/http://cdn.com/shot1_320.jpg",
              "#{Appo::Constants::CDN_URL}s/1024/http://cdn.com/shot2_320.jpg",
              "#{Appo::Constants::CDN_URL}s/1024/http://cdn.com/shot1_480.jpg",
              "#{Appo::Constants::CDN_URL}s/1024/http://cdn.com/shot2_480.jpg"])
        end

        it "returns the Free for a free app" do
          mock_response(response_json("$1.99"))
          expect(fetcher.resource_data[:price]).to eq "$1.99"
        end

      end

    end
  end
end

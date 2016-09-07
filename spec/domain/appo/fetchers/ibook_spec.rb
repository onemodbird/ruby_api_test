require "spec_helper"
require "timecop"
require "typhoeus"
require_relative "../../../../app/domain/appo/fetchers/ibook"

module Appo
  module Fetchers
    describe Ibook do

      let(:id) { "721429965" }
      let(:url) { "https://itunes.apple.com/book/id#{id}" }
      let(:fetcher) { Ibook.new(url) }

      let(:empty_json) do
        %[{
            "resultCount":0,
            "results": []
        }]
      end

      let(:ibook_data) do
        image_url =
          "http://is2.mzstatic.com/image/thumb/Publication69/v4/4f/5c/33" <<
          "/4f5c33de-6cf1-81a8-8b2c-bf8c8fa92223/9780804139038.jpg" <<
          "/100x100bb-85.jpg"

        {
          "name" => "The Martian",
          "price" => "$8.99",
          "owner" => "Andy Weir",
          "image_url" => image_url,
          "defunct_at" => nil
        }
      end

      let(:ibook_json) do
        %[{
          "resultCount": 1,
          "results": [
            {
              "artworkUrl100": "#{ibook_data['image_url']}",
              "artistName": "#{ibook_data['owner']}",
              "trackName": "#{ibook_data['name']}",
              "formattedPrice": "#{ibook_data['price']}"
            }
          ]
        }]
      end

      def mock_response(body)
        expect(Typhoeus)
        .to receive(:get)
        .and_return(double(body: body))
      end

      it "extracts the id from the url" do
        expect(fetcher.instance_variable_get(:@id)).to eq(id)
      end

      describe "#resource_data" do

        it "returns only a defunct_at timestamp if the ibook is not found" do
          Timecop.freeze and mock_response(empty_json)
          expect(fetcher.resource_data).to eq({ "defunct_at" => Time.now.utc })
        end

        it "returns the correct hash of data" do
          mock_response(ibook_json)
          expect(fetcher.resource_data).to eq(ibook_data)
        end

      end

    end
  end
end

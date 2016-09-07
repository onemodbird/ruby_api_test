require "rails_helper"
require "appo/fetchers/app_api_adapters/google_play_html_adapter"

module Appo
  module Fetchers
    describe GooglePlayHtmlAdapter do

      before :all do
        path_prefix = "spec/fixtures/play.google.com"

        @html = {
          facebook: ::File.read("#{path_prefix}_com.facebook.katana_.html"),
          minecraft: ::File.read("#{path_prefix}_com.mojang.minecraftpe_.html")
        }
      end

      let(:adapter) { GooglePlayHtmlAdapter }
      let(:expected_keys) {
        [ :name,
          :price,
          :owner,
          :description,
          :image_url,
          :defunct_at,
          :screenshot_urls]
      }
      let(:minecraft_image_url) {
        "#{Appo::Constants::CDN_URL}a/200/" <<
        "https://lh3.googleusercontent.com/" <<
        "30koN0eGl-" <<
        "LHqvUZrCj9HT4qVPQdvN508p2wuhaWUnqKeCp6nrs9QW8v6IVGvGNauA=w300"
      }
      let(:minecraft_screenshot_url) {
        "#{Appo::Constants::CDN_URL}s/1024/" <<
        "https://lh3.googleusercontent.com/" <<
        "oBRpVTu9NiHqrQrmVxher607QAK82SkLQ_" <<
        "vdtVyLvMdfF2sYxEpdXPM12f_C81U-OMs=h310"
      }

      def id(name)
        { bogus: "a.bogus.google.play.id",
          facebook: "com.facebook.katana",
          minecraft: "com.mojang.minecraftpe"
        }.fetch(name)
      end

      def url(name)
        "https://play.google.com/store/apps/details?id=#{id(name)}"
      end

      it "returns nil when not found" do
        stub_request(:get, url(:bogus)).to_return(status: 404, body: "")
        expect(adapter.app_data(id(:bogus))).to eq(nil)
      end

      it "raises when parsing fails" do
        stub_request(:get, url(:bogus))
          .to_return(status: 200, body: "<html></html>")

        expect { adapter.app_data(id(:bogus)) }
          .to raise_error(Appo::Fetchers::GooglePlayHtmlAdapter::ParseError)
      end

      it "maps an app" do
        stub_request(:get, url(:minecraft))
          .to_return(status: 200, body: @html.fetch(:minecraft))

        data = adapter.app_data(id(:minecraft))

        expect(data.keys).to eq(expected_keys)
        expect(data[:name]).to eq("Minecraft: Pocket Edition")
        expect(data[:price]).to eq("$6.99")
        expect(data[:owner]).to eq("Mojang")
        expect(data[:description]).to match(/Redstone/)
        expect(data[:image_url]).to eq(minecraft_image_url)
        expect(data[:defunct_at]).to eq(nil)
        expect(data[:screenshot_urls].first).to eq(minecraft_screenshot_url)
        expect(data[:screenshot_urls].size).to eq(20)
      end

      it "returns a price of 'Free' for a free app" do
        stub_request(:get, url(:facebook))
          .to_return(status: 200, body: @html.fetch(:facebook))

        data = adapter.app_data(id(:facebook))

        expect(data[:price]).to eq("Free")
      end

    end
  end
end

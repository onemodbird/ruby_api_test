require "spec_helper"
require "postrank-uri"
require_relative "../../../app/domain/appo/uri"


module Appo

  describe URI do

    it "transforms youtu.be URLs to www.youtube.com URLs" do
      input_url = 'https://youtu.be/29MAL8pJImQ'
      clean_url = Appo::URI.clean(input_url)
      expect(clean_url).to eq('https://www.youtube.com/watch?v=29MAL8pJImQ')
    end

    describe "iTunes URLs" do
      it "creates minimal URLs for iOS apps" do
        url = "https://itunes.apple.com/us/app/angry-birds/id343200656?mt=8"
        expected_url = "https://itunes.apple.com/app/id343200656"

        clean_url = Appo::URI.clean(url)
        expect(clean_url).to eq(expected_url)
      end

      it "creates minimal URLs for iBooks" do
        url = "https://itunes.apple.com/us/book/the-martian/id721429965?mt=11"
        expected_url = "https://itunes.apple.com/book/id721429965"

        clean_url = Appo::URI.clean(url)
        expect(clean_url).to eq(expected_url)
      end

      it "creates minimal URLs for interactive iBooks" do
        url = "https://itunes.apple.com/us/book/email/id743560201?mt=13"
        expected_url = "https://itunes.apple.com/book/id743560201"

        clean_url = Appo::URI.clean(url)
        expect(clean_url).to eq(expected_url)
      end

      it "retains full URLs for Mac apps" do
        url = "https://itunes.apple.com/us/app/angry-birds/id403961173?mt=12"
        expect(Appo::URI.clean(url)).to eq(url)
      end

      it "retains full URLs for non-apps" do
        url = "https://itunes.apple.com/us/itunes-u" <<
              "/game-theory-video/id341651977?mt=10"
        expect(Appo::URI.clean(url)).to eq(url)
      end

      it "removes all query params other than 'mt'" do
        url = "https://itunes.apple.com/us/itunes-u" <<
              "/game-theory-video/id341651977?mt=10&x=1&b=c"
        expected_url = "https://itunes.apple.com/us/itunes-u" <<
                       "/game-theory-video/id341651977?mt=10"
        expect(Appo::URI.clean(url)).to eq(expected_url)
      end
    end

  end

end

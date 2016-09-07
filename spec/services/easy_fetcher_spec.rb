require "rails_helper"

describe EasyFetcher do

  let(:url) { Faker::Internet.url }
  let(:redirect_urls) { [ Faker::Internet.url, Faker::Internet.url ] }
  let(:easy_fetcher) { EasyFetcher.get(url) }

  before(:each) do
    stub_request(:get, url)
      .to_return(status: 200, body: "body", headers: {})

    allow(Typhoeus::Request).to receive(:new).and_call_original
  end

  def expect_request_parameters(hash, custom_url: nil)
    expect(Typhoeus::Request)
      .to have_received(:new)
      .with(custom_url || url, hash_including(hash))
  end

  describe ".new" do
    it "is not allowed" do
      expect{ EasyFetcher.new }.to raise_error(NoMethodError)
    end
  end

  describe ".get" do
    it "returns a new instance" do
      expect(EasyFetcher.get(url)).to be_an_instance_of(EasyFetcher)
    end

    describe "behaviors" do
      before(:each) do
        EasyFetcher.get(url)
      end

      it "follows redirects" do
        expect_request_parameters(followlocation: true)
      end

      it "has a 30 second timeout" do
        expect_request_parameters(timeout: 30)
      end

      it "uses compression" do
        expect_request_parameters(accept_encoding: "gzip")
      end

      it "uses cookies" do
        expect_request_parameters(cookiefile: anything, cookiejar: anything)
      end

      it "has empty headers by default" do
        expect_request_parameters(headers: {})
      end

    end

<<<<<<< HEAD
    it "changes user-agent when the URL is to greenprint" do
      greenprint_url = "https://www.greenprintmedia.org"
      stub_request(:get, greenprint_url)
        .to_return(status: 200, body: "body", headers: {})

      EasyFetcher.get(greenprint_url)
      expect_request_parameters(
        { headers: { "User-Agent" => "greenprintLearning/1.0" } },
        custom_url: greenprint_url)
=======
    it "changes user-agent when the URL is to participate" do
      participate_url = "https://www.participate.com"
      stub_request(:get, participate_url)
        .to_return(status: 200, body: "body", headers: {})

      EasyFetcher.get(participate_url)
      expect_request_parameters(
        { headers: { "User-Agent" => "ParticipateLearning/1.0" } },
        custom_url: participate_url)
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    end
  end

  describe "#redirect_urls" do
    it "includes all values from Location headers" do
      request = Typhoeus::Request.new(url)

      response = Typhoeus::Response.new(
        response_headers:
          redirect_urls.map{|u| "Location: #{u}"}.join("\r\n"))

      expect(Typhoeus::Request).to receive(:new).and_return(request)
      expect(request).to receive(:run).and_return(response)

      expect(easy_fetcher.redirect_urls).to eq(redirect_urls)
    end
  end

  describe "streaming protection" do
    def set_content_type(content_type)
      stub_request(:get, url)
        .to_return(status: 200, body: "body", headers: {
          "Content-Type" => content_type
        })
    end

    it "aborts when encountering an audio/* content type" do
      set_content_type("audio/ogg")
      expect(easy_fetcher.headers["Content-Type"]).to eq("audio/ogg")
      expect(easy_fetcher.body).to eq("")
    end

    it "aborts when encountering a video/* content type" do
      set_content_type("video/mp4")
      expect(easy_fetcher.headers["Content-Type"]).to eq("video/mp4")
      expect(easy_fetcher.body).to eq("")
    end
  end

end

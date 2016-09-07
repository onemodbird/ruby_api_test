require 'rails_helper'

module Appo

  describe ResourceFactory do
    let(:app_url) { "https://itunes.apple.com/us/app/itsanapp/id12345?mt=8" }

    it "ignores attributes with nil values" do
      factory = ResourceFactory.new(app_url, attributes: { kind: nil })
      expect(factory.resource.kind).to_not be_nil
    end

    it "uses ResourceKind to determine kind from url" do
      url = Faker::Internet.url

      expect(ResourceKind).to receive(:kind).with(url).and_return("video")
      resource_factory = ResourceFactory.new(url)

      expect(resource_factory.resource.kind).to eq("video")
    end

    it "assigns an app a random update between 12 and 36 hours from now" do
      now = Timecop.freeze

      resource = ResourceFactory.new(app_url).resource
      expect(resource.update_queued_at).to be_within(12.hours).of(now)
    end

    describe "iTunes short urls" do

      it "resolves the short url" do
        short_url = 'https://appsto.re/us/V_vO4.i'
        long_url = 'https://itunes.apple.com/us/app/' <<
                   'adobe-fill-sign-easy-pdf-form/id950099951?mt=8'
        long_normalized_url = 'https://itunes.apple.com/app/id950099951'

        response = double(
          code: 301,
          headers: {
            'location' => long_url
          }
        )
        expect(Typhoeus).to receive(:get).and_return(response)

        rf = ResourceFactory.new short_url
        expect(rf.resource.url).to eq(long_normalized_url)
      end

      it "raises an exception when the response code is not 301" do
        response = double(code: 404)
        expect(Typhoeus).to receive(:get).and_return(response)

        expect {
          ResourceFactory.new 'https://appsto.re/us/V_vO4.i_BOGUS'
        }.to raise_error(RuntimeError)
      end
    end

    it "uses the ibook fetcher for ibook kind" do
      ibook_url = "https://itunes.apple.com/us/book/the-martian/id721429965?mt=11"
      rf = ResourceFactory.new(ibook_url)

      expect(rf.resource.kind).to eq("ibook")
      expect(Fetchers::Ibook)
        .to receive(:new)
        .and_return double(resource_data: {})
      rf.resource_with_data_fetch
    end

  end

end

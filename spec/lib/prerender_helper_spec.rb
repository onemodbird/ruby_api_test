require "rails_helper"

RSpec.describe PrerenderHelper do
  describe ".update_record!" do
    let(:resource) { create :resource }
    let(:url) { double(:url) }

    it "skips records that have not been persisted" do
      expect(PrerenderHelper).not_to receive(:post)
      PrerenderHelper.update_record! Resource.new
    end

    it "POSTs an API request with the record URL" do
      expect(GenerateUrl).to receive(:for).with(resource).and_return(url)
      expect(PrerenderHelper).to receive(:post).with(url)
      PrerenderHelper.update_record! resource
    end
  end
end

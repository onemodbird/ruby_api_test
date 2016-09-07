require "rails_helper"

module Appo
  module Fetchers
    describe File do

      it "assigns correct fallback images" do
        expect(Appo::Fetchers::File.new("file.pdf").image_url).to match /pdf0[1-6].png/
        expect(Appo::Fetchers::File.new("presentation.pptx").image_url).to match /pres0[1-6].png/
        expect(Appo::Fetchers::File.new("doc.docx").image_url).to match /doc0[1-6].png/
        expect(Appo::Fetchers::File.new("random.random").image_url).to match /file0[1-6].png/
      end

    end
  end
end

RSpec.configure do |config|
  config.before :each do |example|
    allow(PrerenderHelper).to receive(:update_record!).and_call_original
  end
end

module Appo
  module Test
    module PrerenderHelpers

      def expect_prerender_record(record)
        expect(PrerenderHelper).to have_received(:update_record!).with(record)
      end

    end
  end
end

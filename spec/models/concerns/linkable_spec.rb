require "rails_helper"

describe ClassLookups do
  before do
    stub_const "Thing", Class.new
    Thing.class_eval do
      include Linkable
      def id; 1; end
      def name; "whatever"; end
    end
  end

  let(:thing) { Thing.new }

  it "uses a dash for the link_resource_path" do
    expect(thing).to receive(:link_resource_path).and_return("under_score")
    expect(thing.link).to eq "https://www.participate.com/under-score/whatever/1"
  end
end

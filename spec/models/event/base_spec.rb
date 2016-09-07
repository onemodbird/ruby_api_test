require "rails_helper"

describe Event::Base do
  class SomeEvent < Event::Base ; end

  it "has a default process! method that does nothing" do
    expect(SomeEvent.new).to respond_to(:process!)
  end
end

require "rails_helper"

describe Typhoeus do
  let(:user_agent) {
    "Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:42.0) Gecko/20100101 Firefox/42.0"
  }

  it "uses a custom user-agent by default" do
    expect(Typhoeus::Config.user_agent).to eq(user_agent)

    expect(Typhoeus::Request.new("url").options[:headers]["User-Agent"])
      .to eq(user_agent)
  end
end

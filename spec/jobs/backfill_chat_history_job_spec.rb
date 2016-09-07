require "rails_helper"

RSpec.describe BackfillChatHistoryJob, type: :job do

  let(:history) { instance_double("GnipService::History") }
  let(:chat) { create(:chat) }
  let(:cursor) { SecureRandom.hex }
  let(:tweet) { double(:tweet) }
  let(:single_page_result) { { "results"=>[tweet] } }
  let(:multi_page_result) { { "next" => cursor, "results"=>[tweet] } }


  before :each do
    allow(GnipService)
      .to receive(:history)
      .and_return(history)

    expect(Sidekiq::Client)
      .to receive(:enqueue_to)
      .with(:import, TweetInjestionJob, tweet, false)
      .at_least(:once)
  end


  it "gets the first page of historical tweets" do
    expect(history)
      .to receive(:get)
      .with(chat.name, nil)
      .and_return(single_page_result)

    BackfillChatHistoryJob.new.perform(chat.id)
  end


  it "follows the next page cursor" do
    expect(history)
      .to receive(:get)
      .with(chat.name, nil)
      .and_return(multi_page_result)

    expect(history)
      .to receive(:get)
      .with(chat.name, cursor)
      .and_return(single_page_result)

    BackfillChatHistoryJob.new.perform(chat.id)
  end


  it "quits when number of tweets >= MAX_TWEET_COUNT" do
    stub_const("BackfillChatHistoryJob::MAX_TWEET_COUNT", 1);

    expect(history)
      .to receive(:get)
      .with(chat.name, nil)
      .and_return(multi_page_result)

    expect(history)
      .not_to receive(:get)
      .with(chat.name, cursor)

    BackfillChatHistoryJob.new.perform(chat.id)
  end
end

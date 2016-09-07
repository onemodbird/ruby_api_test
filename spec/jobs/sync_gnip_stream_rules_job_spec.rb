require "rails_helper"

RSpec.describe SyncGnipStreamRulesJob, type: :job do

  before(:each) do
    allow(GnipService).to receive(:rules).and_return(rules)
  end

  let(:rules) { instance_double("GnipService::Rules") }

  it "adds chats to rules" do
    live_chats = %w()

    expect(rules).to receive(:get).and_return(live_chats)
    expect(rules).to receive(:add).with(%w(chat1))
    expect(rules).to receive(:remove).with([])

    create(:chat, name: "chat1")
    SyncGnipStreamRulesJob.new.perform
  end

  it "removes chats from rules" do
    live_chats = %w(chat1)

    expect(rules).to receive(:get).and_return(live_chats)
    expect(rules).to receive(:add).with(%w())
    expect(rules).to receive(:remove).with(%w(chat1))

    SyncGnipStreamRulesJob.new.perform
  end

  it "does nothing when there are no changes" do
    live_chats = %w(chat1)

    expect(rules).to receive(:get).and_return(live_chats)
    expect(rules).to receive(:add).with(%w())
    expect(rules).to receive(:remove).with(%w())

    create(:chat, name: "chat1")
    SyncGnipStreamRulesJob.new.perform
  end
end

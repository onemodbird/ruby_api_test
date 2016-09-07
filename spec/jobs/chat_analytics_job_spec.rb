require "rails_helper"

RSpec.describe ChatAnalyticsJob, type: :job do

  let(:job) { ChatAnalyticsJob.new }
  let(:chat) { create :chat }
  let(:messages) { create_list(:chat_message, 5, chat: chat) }
  let(:same_user_messages) { create_list(:chat_message, 5, chat: chat, twitter_handle: "TestyMcTesterson") }
  let(:old_messages) { create_list(:chat_message, 5, chat: chat, tweeted_at: Time.now - 1.year) }
  let(:retweets) { messages.map{ |msg| create :chat_message, retweeted_chat_message_id: msg.id, retweet: true, chat: chat }}

  it "calculates unique message & participant count in the last month" do
    messages + same_user_messages + old_messages + retweets
    job.perform

    chat.reload
    expect(chat.analytics["monthly_messages"]).to eq 10
    expect(chat.analytics["monthly_participants"]).to eq 11
    expect(chat.analytics["monthly_retweets"]).to eq 5
  end
end

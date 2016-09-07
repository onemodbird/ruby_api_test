# TODO
# Test analytics creation
# Create endpoint
require "rails_helper"

RSpec.describe ChatOccurrenceSummary, type: :model do
  let(:chat) { create :chat, :with_moderators }
  let(:schedule_occurrence) { create :schedule_occurrence, schedulable: chat }
  let(:summary) { ChatOccurrenceSummary.generate(schedule_occurrence) }
  let(:moderator) { User.find_by(twitter_id: chat.moderators.values.first["id"])}

  it "captures moderators" do
    expect(summary.moderators).to eq chat.moderators
  end

  it "captures a transcript and collection" do
    expect(summary.transcript).to_not be_nil
    expect(summary.transcript.collection).to_not be_nil
  end

  context "with messages and such" do
    let(:during) { schedule_occurrence.start_time + 1.second }
    let!(:messages) do
      create_list(:chat_message, 2, :with_resource,
        chat: chat,
        tweeted_at: during
      )
    end
    let!(:retweet) do
      create(:chat_message,
        retweeted_chat_message: messages[0],
        retweet: true,
        chat: chat,
        tweeted_at: during)
    end
    let!(:chat_message) do
      create(:chat_message,
        chat: chat,
        user: moderator,
        twitter_id: moderator.twitter_id,
        tweeted_at: during,
        text: "Q1: wat?")
    end
    let!(:question) do
      create(:question_and_answer, :question_with_answer,
        chat_message: chat_message,
        created_at: during)
    end

    it "captures analytics" do
      expect(summary.analytics.symbolize_keys).to eq ({
        answer_count: 1,
        message_count: 4,
        participant_count: 5,
<<<<<<< HEAD
        greenprint_user_count: 1,
=======
        participate_user_count: 1,
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        question_count: 1,
        resource_count: 2,
        retweet_count: 1
         })
    end
  end
end

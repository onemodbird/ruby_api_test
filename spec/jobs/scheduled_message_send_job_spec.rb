require "rails_helper"

RSpec.describe ScheduledMessageSendJob, type: :job do
  let(:user) { create :user, :twitter, twitter_auth_token: "abc@123" }
  let(:chat) { create :chat, :with_schedule, promos_enabled: false }
  let(:scheduled_at) { (Time.now + 1.day).to_i }
  let(:scheduled_message) { create :scheduled_message, user: user }
  let(:reloaded_message) { scheduled_message.reload }
  let(:tweet_id) { 209385029239 }
  before do
    Timecop.freeze
    allow_any_instance_of(ScheduledMessage).to receive(:schedule_job)
    @update_request = stub_request(:post, "https://api.twitter.com/1.1/statuses/update.json")
      .to_return(body: { id: tweet_id }.to_json)
  end

  def expect_failure(error_message)
    expect { subject.perform(scheduled_message.id) }
      .to raise_error(RuntimeError, Regexp.new(error_message))

    expect(reloaded_message.completed_at).to eq Time.now
    expect(reloaded_message.error).to eq(error_message)
  end

  context "with unauthorized user" do
    let(:user) { create :user, :twitter }

    it "fails when user has no twitter auth" do
      expect_failure "Twitter Auth Token not set"
    end
  end

  context "with a chat promo" do
    before :each do
      scheduled_message.update(chat_promo_id: SecureRandom.uuid,
        schedule_occurrence: chat.schedule_occurrences.first)
    end

    it "fails when the scheduled occurrence is not found" do
      scheduled_message.schedule_occurrence.delete
      expect_failure "Scheduled occurrence not found"
    end

    it "fails when promos are disabled for the chat" do
      expect_failure "Promos disabled for chat"
    end

    it "fails as canceled when chat is archived" do
      chat.archive!

      subject.perform(scheduled_message.id)
      expect(reloaded_message.error).to eq("Scheduled occurrence not found, Canceled")
    end
  end

  it "sends a message" do
    subject.perform(scheduled_message.id)

    expect(reloaded_message.tweet_id).to eq tweet_id.to_s
    expect(reloaded_message.completed_at).to eq Time.now
    expect(reloaded_message.error).to be_nil
    assert_requested(@update_request)
  end

  it "skips sending a canceled message" do
    scheduled_message.cancel

    subject.perform(scheduled_message.id)

    expect(reloaded_message.canceled_at).to eq Time.now
    expect(reloaded_message.tweet_id).to be_nil
    expect(reloaded_message.error).to eq("Canceled")
    assert_not_requested(@update_request)
  end

  it "sends a realtime update when sent" do
    expect(RealtimeService)
      .to receive(:publish).with(
        user,
        "scheduled_message_sent",
        true,
        any_args)

    subject.perform(scheduled_message.id)
  end

  context "with an image" do
    let(:scheduled_message) { create :scheduled_message, :with_image, user: user }
    let(:media_id) { 2983572983 }

    before do
      @upload_request = stub_request(:post, "https://upload.twitter.com/1.1/media/upload.json")
        .to_return(body: { media_id: media_id }.to_json)
    end

    it "sends a message with an image" do
      subject.perform(scheduled_message.id)

      expect(reloaded_message.tweet_id).to eq tweet_id.to_s
      expect(reloaded_message.completed_at).to eq Time.now
      expect(reloaded_message.error).to be_nil
      assert_requested(@upload_request)
    end
  end
end

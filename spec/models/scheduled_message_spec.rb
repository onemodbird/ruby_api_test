require "rails_helper"

describe Appo::Api::ScheduledMessages do
  let(:user) { create :user, :twitter, twitter_auth_token: "its@atoken" }
  let(:scheduled_message) { create :scheduled_message, user: user }
  let(:replacement) { ScheduledMessage.active.first }
  let(:the_future) { Time.now + 1.week }
  let(:image) do
    Rack::Test::UploadedFile.new(Rails.root.join("spec/fixtures/pixel.png"))
  end

  before do |example|
    Timecop.freeze
  end

  it "enqueues and records id of message send job" do
    expect(scheduled_message.job_id).to_not be_nil
  end

  it "allows setting scheduled_at via an epoch" do
    scheduled_message = create :scheduled_message, scheduled_at: the_future.to_i

    expect(scheduled_message.scheduled_at.to_i).to eq the_future.to_i
  end

  it "doesn't replace a scheduled message if it's too late" do
    Timecop.freeze(scheduled_message.scheduled_at)

    replacement = scheduled_message.replace(text: "new")
    expect(ScheduledMessage.count).to eq 1
    expect(replacement).to_not be_valid
    expect(scheduled_message).to_not be_canceled
  end

  it "replaces a scheduled messages text" do
    scheduled_message.replace(text: "new")

    expect(scheduled_message).to be_canceled
    expect(replacement.image).to eq scheduled_message.image
    expect(replacement.text).to eq "new"
  end

  it "replaces a scheduled messages scheduled_at" do
    scheduled_message.replace(scheduled_at: the_future)
    expect(scheduled_message).to be_canceled
    expect(replacement.scheduled_at.to_i).to eq the_future.to_i
  end

  it "replaces a scheduled messages image" do
    scheduled_message.replace(image_file: image)
    expect(scheduled_message).to be_canceled
    expect(replacement.image).to_not eq scheduled_message.image
  end
end

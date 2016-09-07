require "rails_helper"

describe LearningRegistrySubmission do
  let(:submission) { create :learning_registry_submission }
  before do
    Timecop.freeze
  end

  it "has no default approval and is not reviewed" do
    expect(submission.approved).to be_nil
    expect(submission.reviewed_at).to be_nil
  end

  it "marks a learning registry submission rejected and does not submit" do
    expect(LearningRegistryPublishJob).to_not receive(:perform_async)

    submission.reject

    expect(submission.approved).to eq false
    expect(submission.reviewed_at).to eq Time.now
  end

  it "marks a learning registry submission approved and submits" do
    expect(LearningRegistryPublishJob).to receive(
      :perform_async).with(submission.resource.id, "create")

    submission.approve

    expect(submission.approved).to eq true
    expect(submission.reviewed_at).to eq Time.now
  end
end

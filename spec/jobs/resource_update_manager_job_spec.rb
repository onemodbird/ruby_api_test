require "rails_helper"

RSpec.describe ResourceUpdateManagerJob, type: :job do
  KINDS = [:webpage, :video, :ios_app, :android_app, :ibook]

  def resources!(attributes = {})
    KINDS.map { |k| create :resource, k, attributes }
  end

  def perform(type = "app")
    subject.perform({resource_type: type, interval: 86400, skip_defunct: false})
  end

  before do
    Timecop.freeze
    allow(ResourceUpdateJob).to receive(:perform_async)
  end

  it "bumps updates by 24 hours" do
    resources!(update_queued_at: Time.now - 1.day - 1.second)
    [:app, :video, :webpage, :ibook].each { |kind| perform(kind) }

    expect(Resource.where(update_queued_at: Time.now - 1.second).count).to eq 5
  end

  it "doesn't attempt updates if update_queue_at is nil" do
    resources!

    perform
    expect(Resource.where(update_queued_at: nil).count).to eq 5
  end

  it "doesn't update files" do
    file = create :resource, :file, update_queued_at: Time.now - 2.days
    perform

    expect(file.reload.update_queued_at).to eq Time.now - 2.days
  end
end

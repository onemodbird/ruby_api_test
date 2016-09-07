require "rails_helper"

RSpec.describe RealtimeNotificationJob, type: :job do

  let(:notification) { create :notification }

  it "updates the notification realtime status" do
    expect(notification.realtime).to eq(false)
    RealtimeNotificationJob.new.perform(notification.id)
    expect(notification.reload.realtime).to eq(true)
  end

end

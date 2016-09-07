require "rails_helper"

RSpec.describe EmailNotificationJob, type: :job do

  let(:notification) { create :notification }

  it "updates the notification email status" do
    expect(notification.email).to eq(false)
    EmailNotificationJob.new.perform(notification.id)
    expect(notification.reload.email).to eq(true)
  end

end

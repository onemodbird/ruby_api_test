require "rails_helper"

RSpec.describe Notification, type: :model do

  let(:user) { create :user, :registered }
  let(:key) { SecureRandom.hex }
  let(:notification) { create :notification }

  it "is valid with a user and key" do
    expect(Notification.new(user: user, key: key).valid?).to eq(true)
  end

  it "requires a user" do
    expect(Notification.new(key: key).valid?).to eq(false)
  end

  it "requires a key" do
    expect(Notification.new(user: user).valid?).to eq(false)
  end

  it "defaults status flags to false if the user receives email" do
    expect(notification.email).to eq(false)
    expect(notification.realtime).to eq(false)
  end

  it "sets email flag to nil/NULL if it can't send email" do
    user = create :user, :registered, email_notifications: false
    notification = create :notification, user: user

    expect(notification.email).to eq(nil)
    expect(notification.realtime).to eq(false)
  end


  describe "async jobs" do
    let(:do_not_email_user) {
      create :user, :registered, email_notifications: false
    }
    let(:uuid) { SecureRandom.uuid }
    let(:email) { EmailNotificationJob }
    let(:realtime) { RealtimeNotificationJob }

    before(:each) do
      allow(email).to receive(:perform_async)
      allow(realtime).to receive(:perform_async)
    end

    it "queues notification jobs when a notification is created" do
      expect(email).to have_received(:perform_async).with(notification.id)
      expect(realtime).to have_received(:perform_async).with(notification.id)
    end

    it "does not send email notification when prevented by user preference" do
      notification = create :notification, user: do_not_email_user

      expect(realtime).to have_received(:perform_async).with(notification.id)
      expect(email).not_to have_received(:perform_async).with(notification.id)
    end

    it "only queues notification jobs when notification is created" do
      notification
      expect(email).not_to receive(:perform_async)
      expect(realtime).not_to receive(:perform_async)

      notification.update!(key: SecureRandom.hex)
    end

    it "does not queue notification jobs when notification creation fails" do
      expect { create :notification, id: uuid,  key: nil }
        .to raise_error(ActiveRecord::RecordInvalid)

      expect(email).not_to have_received(:perform_async).with(uuid)
      expect(realtime).not_to have_received(:perform_async).with(uuid)
    end
  end

end

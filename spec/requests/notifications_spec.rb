require "rails_helper"

describe Appo::Api::Notifications do

  let(:user) { create :user, :registered }
  let(:notification) { create :notification, user: user }
  let(:notifications) { [ notification, create(:notification, user: user) ] }
  let(:old_notification) {
    create :notification, user: user, created_at: 1.day.ago
  }

  let(:other_user) { create :user, :registered }
  let(:other_notification) { create :notification, user: other_user }
  let(:mixed_notifications) { [other_notification, notification] }

  def api_notification_ids
    json_response.fetch("notifications").map { |b| b.fetch("id") }
  end

  describe "GET /notifications" do
    it "returns a list of notifications owned by the user" do
      notification and other_notification
      api_get "/v1/notifications", user

      expect_response_code_of(200)
      expect(api_notification_ids).to eq([ notification.id ])
      expect(json_response.fetch("unacknowledged")).to eq 1
    end

    it "sorts by created_at desc" do
      notification and old_notification
      api_get "/v1/notifications", user

      expect_response_code_of(200)
      expect(api_notification_ids).to eq([ notification.id, old_notification.id ])
    end

    it "403s if the user isn't logged in" do
      api_get "/v1/notifications", nil
      expect_response_code_of(403)
    end
  end

  describe "PUT /notifications" do

    let(:params) {{
      acknowledged: true,
      ids: notifications.map(&:id)
    }}

    it "marks a notification as acknowledged" do
      api_put "/v1/notifications", user, params
      expect_response_code_of(204)
      notifications.each do |notification|
        expect(notification.reload.acknowledged).to eq(true)
      end
    end

    it "404s if the notification is not found" do
      api_put "/v1/notifications", user, params.merge(ids: [SecureRandom.uuid])
      expect_response_code_of(404)
    end

    it "403s if the user isn't logged in" do
      api_put "/v1/notifications", nil, params
      expect_response_code_of(403)
    end

    it "403s if the user doesn't own the notification" do
      api_put "/v1/notifications", other_user, params
      expect_response_code_of(403)
    end
  end

  describe "PUT /notifications/all" do

    it "acknowledges all notifications" do
      expect(mixed_notifications.map(&:acknowledged)).to eq [false, false]

      api_put "/v1/notifications/all", user, acknowledged: true
      expect_response_code_of(204)
      expect(mixed_notifications.map{ |n| n.reload; n.acknowledged }).to eq [false, true]
    end

  end

  describe "PUT /notifications/:id" do

    let(:params) { { acknowledged: true } }

    it "marks a notification as acknowledged" do
      api_put "/v1/notifications/#{notification.id}", user, params
      expect_response_code_of(204)
      expect(notification.reload.acknowledged).to eq(true)
    end

    it "404s if the notification is not found" do
      api_put "/v1/notifications/#{SecureRandom.uuid}", user, params
      expect_response_code_of(404)
    end

    it "403s if the user isn't logged in" do
      api_put "/v1/notifications/#{notification.id}", nil, params
      expect_response_code_of(403)
    end

    it "403s if the user doesn't own the notification" do
      api_put "/v1/notifications/#{notification.id}", other_user, params
      expect_response_code_of(403)
    end
  end
end

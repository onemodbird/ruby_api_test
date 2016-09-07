require "rails_helper"

describe Appo::Api::ScheduledMessages do
  before(:each) { allow_any_instance_of(ScheduledMessage).to receive(:schedule_job)}
  let(:user) { create :user, :twitter }
  let(:other) { create :user, :twitter }

  describe "GET /scheduled_messages" do
    it "displays my scheduled chats" do
      messages = create_list :scheduled_message, 2, user: user

      api_get "/v1/scheduled_messages", user

      expect(json_response).to match_ids_of messages
    end

    it "does not display completed chat messages" do
      message = create :scheduled_message, user: user
      completed = create(:scheduled_message, user: user, completed_at: Time.now, job_id: "bloop")

      api_get "/v1/scheduled_messages", user

      expect(json_response[0]["id"]).to eq message.id
    end

    it "does not display canceled chat messages" do
      message = create :scheduled_message, user: user
      canceled = create(:scheduled_message, user: user).cancel

      api_get "/v1/scheduled_messages", user

      expect(json_response[0]["id"]).to eq message.id
    end
  end

  describe "DELETE /scheduled_messages" do
    let!(:scheduled_message) { create :scheduled_message, user: user }

    it "deletes a scheduled message" do
      api_delete "/v1/scheduled_messages/#{scheduled_message.id}", user
      expect(scheduled_message.reload.canceled_at.to_i).to eq Time.now.to_i
    end

    it "doesn't allow a non-logged in user to delete a scheduled message" do
      delete "/v1/scheduled_messages/#{scheduled_message.id}"
      expect_response_code_of 403
    end

    it "doesn't allow an alternate user to delete a scheduled message" do
      api_delete "/v1/scheduled_messages/#{scheduled_message.id}", other
      expect_response_code_of 403
    end
  end

  describe "PUT /scheduled_messages" do
    let!(:scheduled_message) { create :scheduled_message, user: user }

    it "marks canceled and creates a new message" do
      canceled_at_i = Timecop.freeze(1.hour).to_i
      expect(scheduled_message.canceled_at.to_i).to_not eq(canceled_at_i)

      expect {
        api_put "/v1/scheduled_messages/#{scheduled_message.id}", user,
          text: "new", token: "abc@123"
      }.to change(ScheduledMessage, :count).from(1).to(2)

      expect(scheduled_message.reload.canceled_at.to_i).to eq(canceled_at_i)
      expect(ScheduledMessage.active.count).to eq 1
    end
  end

  describe "POST /scheduled_messages" do
    let(:image) { test_rack_file }

    def create_params(params = {})
      { text: "It's a tweet #YayItsATweet",
        scheduled_at: (Time.now + 1.day).to_i,
        token: "abc@123" }.merge(params)
    end

    it "creates a scheduled message" do
      expect {
        api_post "/v1/scheduled_messages", user, create_params
      }.to change(ScheduledMessage, :count).from(0).to(1)
    end

    it "captures the auth token" do
      api_post "/v1/scheduled_messages", user, create_params
      expect(user.reload.twitter_auth_token).to eq create_params[:token]
    end

    it "create a scheduled message with an image" do
      expect { api_post "/v1/scheduled_messages", user, create_params(image_file: image) }
        .to change(UploadedFile, :count).by(1)

      expect(ScheduledMessage.first.image.url).to match /pixel.png/
      expect(json_response["image_url"]).to match /pixel.png/
    end

    it "fails gracefully when the max file size is exceeded" do
      allow_any_instance_of(UploadedFile).to receive(:file_size).and_return(3.1)
      api_post "/v1/scheduled_messages", user, create_params(image_file: image)

      expect_response_code_of 400
      expect(json_response).to eq({"error" => "Image file cannot be larger than 3MB"})
    end

    it "dissallows a scheduled message that is too close to current time" do
      api_post "/v1/scheduled_messages", user,
        create_params(scheduled_at: (Time.now + 30.seconds).to_i)

      expect_response_code_of 400
      expect(json_response).to eq({"error" => "Scheduled at must be at least 1 minute from now"})
    end

    it "doesn't allow a non-logged in user to create a scheduled message" do
      expect {
        post "/v1/scheduled_messages", create_params
      }.to_not change(ScheduledMessage, :count)

      expect_response_code_of 403
    end
  end
end

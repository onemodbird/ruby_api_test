require "rails_helper"

describe Appo::Api::Subscriptions do
  let(:user) { create :user, :registered }
  let(:user2) { create :user, :registered }
  let(:collection) { create :collection, user: user }
  let(:chat) { create :chat }
  let(:subscribables) {{ collection: collection, chat: chat, user: user }}

  describe "GET /v1/" do
    def subscribe_to_list(number, factory)
      things = create_list(factory, number)
      things.each { |thing| thing.subscribe(user.id) }
    end

    it "lists user subscriptions" do
      users = subscribe_to_list(2, :user)
      api_get "/v1/subscriptions?type=user", user

      returned_users = json_response["subscriptions"].map{ |sub| sub["user"] }
      expect(returned_users).to match_ids_of users
    end

    it "lists collection subscriptions" do
      collections = subscribe_to_list(2, :collection)
      api_get "/v1/subscriptions?type=collection", user

      returned_users = json_response["subscriptions"].map{ |sub| sub["collection"] }
      expect(returned_users).to match_ids_of collections
    end
  end

  describe "POST /v1/subscriptions" do
    it "subscribes to a subscribable" do
      subscribables.each do |key, subscribable|
        api_post "/v1/subscriptions?#{key}_id=#{subscribable.id}", user2

        expect_response_code_of 201
        expect_tracking :subscribe,
          user_id: user2.id,
          data: { :"#{key}_id" => subscribable.id }
      end

      expect(user2.subscriptions.count).to eq(subscribables.size)
    end

    it "does subscribe twice" do
      api_post "/v1/subscriptions?collection_id=#{collection.id}", user

      expect_response_code_of 201
      expect(user.subscriptions.count).to eq 1
    end

    it "requires a subscribable_id" do
      api_post "/v1/subscriptions", user2

      expect_response_code_of 400
      expect(json_response["error"]).to be_present
    end

    it "doesn't allow a non logged in users subscribe" do
      post "/v1/subscriptions?collection_id=#{collection.id}"

      expect_response_code_of 403
    end
  end

  describe "DELETE /v1/subscriptions" do
    before do
      subscribables.each do |key, subscribable|
        subscribable.subscribe(user2.id)
      end
    end

    it "unsubscribes" do
      subscribables.each do |key, subscribable|
        api_delete "/v1/subscriptions?#{key}_id=#{subscribable.id}", user2

        expect_response_code_of 204
        expect_tracking :unsubscribe,
          user_id: user2.id,
          data: { :"#{key}_id" => subscribable.id }
      end

      expect(user2.subscriptions.count).to eq 0
    end

    it "doesn't allow a non logged in users unsubscribe" do
      delete "/v1/subscriptions?collection_id=#{collection.id}"

      expect_response_code_of 403
    end
  end
end

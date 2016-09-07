# TODO
# resources
# reviews
# users
# articles
# change_logs
# collection_groups

require "rails_helper"

describe AnalyticsService do

  let(:user) { create :user, :registered }
  let(:collection) { create(:collection, user: user) }

  describe "bookmarks" do
    let(:bookmark) { create :bookmark, user: user }

    it "tracks bookmarks list" do
      api_get "/v1/bookmarks", user

      expect_tracking :bookmark_list, user_id: user.id
    end

    it "tracks bookmark add" do
      api_post "/v1/bookmarks", user, {url: "www.itsaweb.app"}

      expect_tracking :bookmark_create, user_id: user.id, data: { url: "www.itsaweb.app"}
    end

    it "tracks bookmark delete" do
      api_delete "/v1/bookmarks/#{bookmark.id}", user

      expect_tracking :bookmark_delete, user_id: user.id, data: { id: bookmark.id }
    end
  end

  describe "collaborations" do
    let(:user2) { create :user, :registered }
    let(:email) { "abcd@abcd.com" }
    let(:collaboration) { Collaboration.invite!(collection, emails: email)[0] }

    it "tracks an invitation" do
      api_post "/v1/collaborations", user,
        collection_id: collection.id, email: email

      expect_tracking :collaboration_create, user_id: user.id, data: { "collection_id" => collection.id }
    end

    it "tracks a confirmation" do
      api_post "/v1/collaborations/confirm",
        user2, token: collaboration.token

      expect_tracking :collaboration_confirm, user_id: user2.id
    end

    it "tracks removal" do
      api_delete "/v1/collaborations/#{collaboration.id}", user

      expect_tracking :collaboration_delete, user_id: user.id, data: { id: collaboration.id }
    end
  end

  describe "collections" do
    # TODO: Anonymous tracking
    # it "tracks a search" do
    #   get "/v1/collections?q=thing&tag=it,works"

    #   expect_tracking :collection_search, nil, q: "thing", tag: "it,works"
    # end

    it "tracks a collection creation" do
      api_post "/v1/collections", user, collection: { name: "collection" }

      expect_tracking :collection_create, user_id: user.id
    end

    # TODO: Anonymous tracking
    # it "tracks a collection view" do
    #   get "/v1/collections/#{collection.id}"

    #   expect_tracking :collection_view, nil, collection_id: collection.id
    # end
  end

  describe "collection resource" do
    let(:resource) { create :resource }

    it "tracks a resource addition" do
      api_post "/v1/collections/#{collection.id}/resources", user, id: resource.id

      expect_tracking :collection_resource_create, user_id: user.id, data: { collection_id: collection.id, id: resource.id }
    end

    it "tracks a resource delete" do
      assign_resources(collection, resource)
      api_delete "/v1/collections/#{collection.id}/resources/#{resource.id}", user

      expect_tracking :collection_resource_delete, user_id: user.id, data: { collection_id: collection.id, id: resource.id }
    end
  end

  describe "comments" do
    let(:comment) { collection.comment(user, Faker::Lorem.sentence) }

    it "tracks a comment listing" do
      api_get "/v1/comments?collection_id=#{collection.id}", user

      expect_tracking :comment_list, user_id: user.id, data: { collection_id: collection.id }
    end

    it "tracks a comment addition" do
      api_post "/v1/comments?collection_id=#{collection.id}", user, { content: Faker::Lorem.sentence }

      expect_tracking :comment_create, user_id: user.id, data: { collection_id: collection.id }
    end

    it "tracks comment deletion" do
      api_delete "/v1/comments/#{comment.id}", user

      expect_tracking :comment_delete, user_id: user.id, data: { id: comment.id }
    end

    it "tracks comment udpate" do
      api_put "/v1/comments/#{comment.id}", user, { content: "New" }

      expect_tracking :comment_update, user_id: user.id, data: { id: comment.id }
    end
  end

  # TODO: Anonymous tracking
  # describe "home" do
  #   it "tracks a home view" do
  #     get "/v1/home"

  #     expect_tracking :home_view
  #   end
  # end

  # TODO: Anonymous tracking
  # describe "password" do
  #   let(:token) { mail_body.match(/reset_password_token\=([^"]+)/)[1] }

  #   it "tracks a password reset requests and resets" do
  #     api_post "/v1/passwords", nil, { email: user.email }
  #     api_put "/v1/passwords/#{token}", nil, { password: "floopdedoop", password_confirmation: "floopdedoop"  }

  #     expect_tracking :password_reset_request
  #     expect_tracking :password_reset
  #   end
  # end

  # TODO: Anonymous tracking
  # describe "search" do
  #   it "tracks a search" do
  #     params = { q: "cheese", types: "ios-app", grades: "1st", prices: "paid" }
  #     get "/v1/search", params

  #     expect_tracking :search, nil, params
  #   end
  # end
end

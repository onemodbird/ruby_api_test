require "rails_helper"

describe Appo::Api::Bookmarks do

  let(:user) { create :user, :registered }
  let(:bookmark) { create :bookmark, user: user }
  let(:old_bookmark) { create :bookmark, user: user, updated_at: 1.day.ago }

  let(:other_user) { create :user, :registered }
  let(:other_bookmark) { create :bookmark, user: other_user }

  let(:url) { Faker::Internet.url }

  def api_bookmark_ids
    json_response.fetch("bookmarks").map { |b| b.fetch("id") }
  end

  describe "GET /bookmarks" do
    it "returns a list of bookmarks owned by the user" do
      bookmark and other_bookmark
      api_get "/v1/bookmarks", user

      expect_response_code_of(200)
      expect(api_bookmark_ids).to eq([ bookmark.id ])
    end

    it "sorts by updated_at desc" do
      bookmark and old_bookmark
      api_get "/v1/bookmarks", user

      expect_response_code_of(200)
      expect(api_bookmark_ids).to eq([ bookmark.id, old_bookmark.id ])
    end

    it "403s if the user isn't logged in" do
      api_get "/v1/bookmarks", nil
      expect_response_code_of(403)
    end
  end

  describe "POST /bookmarks" do
    it "creates a bookmark" do
      api_post "/v1/bookmarks", user, url: url

      expect_response_code_of(201)
      expect(json_response.fetch("url")).to eq(url)
    end

    it "requires a non-blank url param" do
      api_post "/v1/bookmarks", user, url: ""
      expect_response_code_of(400)
    end

    it "requires optional title param to be non-blank" do
      api_post "/v1/bookmarks", user, url: url, title: ""
      expect_response_code_of(400)
    end

    it "requires optional favicon_url param to be non-blank" do
      api_post "/v1/bookmarks", user, url: url, favicon_url: ""
      expect_response_code_of(400)
    end

    it "touches updated_at if the bookmark/url exists" do
      original_updated_at = bookmark.updated_at

      Timecop.freeze 10.minutes
      api_post "/v1/bookmarks", user, url: bookmark.url

      expect_response_code_of(201)
      expect(bookmark.reload.updated_at > original_updated_at).to eq(true)
    end

    it "prevents url collisions between users" do
      api_post "/v1/bookmarks", other_user, url: bookmark.url

      expect_response_code_of(201)
      expect(json_response.fetch("id")).not_to eq(bookmark.id)
      expect(json_response.fetch("user_id")).not_to eq(bookmark.user_id)
    end

    it "403s if the user isn't logged in" do
      api_post "/v1/bookmarks", nil, url: url
      expect_response_code_of(403)
    end
  end

  describe "DELETE /bookmarks/:id" do
    it "deletes a bookmark" do
      api_delete "/v1/bookmarks/#{bookmark.id}", user
      expect_response_code_of(204)
    end

    it "404s if the bookmark is not found" do
      api_delete "/v1/bookmarks/#{SecureRandom.uuid}", user
      expect_response_code_of(404)
    end

    it "403s if the user isn't logged in" do
      api_delete "/v1/bookmarks/#{bookmark.id}", nil
      expect_response_code_of(403)
    end

    it "403s if the user doesn't own the bookmark" do
      api_delete "/v1/bookmarks/#{bookmark.id}", other_user
      expect_response_code_of(403)
    end
  end
end

require "rails_helper"

describe Appo::Api::Articles do
  let(:article) { create :article, channel: "advisor" }
  let(:blog_article) { create :article, channel: "blog" }
  let(:unpublished) { create :article, published_at: nil }

  def use *args
    Article.create_index!
    Article.import
    Article.refresh_index!
  end

  describe "GET /articles" do
    before :each do
      use article, blog_article, unpublished
    end

    it "gets all articles by default" do
      get "/v1/articles"
      expect(json_response["articles"].size).to eq(2)
      expect(json_response["articles"].first["id"]).to eq(blog_article.id)
    end

    it "optionally filters for advisor articles" do
      get "/v1/articles", channel: "advisor"
      expect(json_response["articles"].size).to eq(1)
      expect(json_response["articles"].first["id"]).to eq(article.id)
    end

    it "optionally filters for blog articles" do
      get "/v1/articles", channel: "blog"
      expect(json_response["articles"].size).to eq(1)
      expect(json_response["articles"].first["id"]).to eq(blog_article.id)
    end
  end

  describe "GET /articles/:id" do
    it "gets an article" do
      use article
      get "/v1/articles/#{article.id}"

      expect_response_code_of(200)
      expect(json_response["article"]["id"]).to eq(article.id)
    end

    it "404s if not found" do
      get "/v1/articles/#{SecureRandom.uuid}"
      expect_response_code_of(404)
    end

    it "404s when unpublished" do
      get "/v1/articles/#{unpublished.id}"
      expect_response_code_of(404)
    end
  end
end

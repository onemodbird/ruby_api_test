require "rails_helper"

describe Appo::Api::Users do
  let(:user) { create(:user, :google, email: "a@b.com").tap { User.refresh_index! } }
  let(:other) { create(:user, :google, email: "b@c.com").tap { User.refresh_index! } }

  let(:public_collection) {
    Collection.create!(
      user_id: user.id,
      name: "name",
      visibility: "public",
    )
  }

  def make_collection(method, attrs = {})
    Collection.public_send(method, {
      user_id: user.id,
      name: "name",
      visibility: "public"
    }.merge(attrs))
  end

  it "provides email if user is looking at themselves" do
    api_get "/v1/users/#{user.id}", user
    expect(response.body).to match(/a\@b.com/)
  end

  it "hides email if user is looking at someone else" do
    get "/v1/users/#{user.id}?auth_token=xyz"
    expect(response.body).to_not match(/a\@b.com/)
  end

  it "hides hidden & private collections" do
    public_c = make_collection :create!
    hidden_c = make_collection :create!, visibility: "hidden"
    private_t = make_collection :create!, visibility: "private"

    get "/v1/users/#{user.id}"
    user = JSON.parse(response.body)

    expect(user.fetch("collections").size).to eq(1)
    expect(user.fetch("collections").first.fetch("id")).to eq(public_c.id)
  end

  it "shows hidden & private collections to the creating user" do
    public_c = make_collection :create!
    hidden_c = make_collection :create!, visibility: "public"
    private_t = make_collection :create!, visibility: "private"

    get "/v1/users/#{user.id}?auth_token=#{user.auth_token}"
    user = JSON.parse(response.body)

    expect(user.fetch("collections").size).to eq(3)
  end

  describe "autocomplete" do
    before(:each) do
      User.create_index!
    end

    it "returns basic user info" do
      get "/v1/users/autocomplete", name: user.name.split.first

      users = json_response.deep_symbolize_keys.fetch(:users)
      expect(users.size).to eq(1)
      expect(users.first[:id]).to eq(user.id)
      expect(users.first[:name]).to eq(user.name)
    end
  end

  describe "User signup" do
    let(:user) { build :user }

    def expect_valid_user
      expect_response_code_of 201
      expect(json_response["id"]).to_not be_blank
      expect(json_response["name"]).to eq user.name
    end

    def user_params(provider, token)
      { user: {
          provider: provider,
          name: user.name,
          provider_token: token } }
    end

    it "allows signup with an email and password" do
      expect {
          post("/v1/users", user_params("email", "#{user.email}:password"))
        }.to change{ User.count }.by(1)

      expect_valid_user
    end

    it "fails email signup with short password" do
      expect {
          api_post("/v1/users", nil, user_params("email", "#{user.email}:nope"))
        }.to_not change{ User.count }

      expect_response_code_of 422
      expect(json_response["error"]).to match /Password is too short/
    end

    it "allows signup with facebook" do
      mock_auth("Facebook", name: user.name, provider_id: "123456789")
      expect {
          api_post("/v1/users", nil, user_params("facebook", "123456789"))
        }.to change{ User.count }.by(1)

      expect_valid_user
    end

    it "allows signup with twitter" do
      mock_auth("Twitter", name: user.name, provider_id: "123456789")
      expect {
          post("/v1/users", user_params("twitter", "123456789"))
        }.to change{ User.count }.by(1)

      expect_valid_user
    end

    it "allows signup with google" do
      mock_auth("Google", name: user.name, provider_id: "123456789")
      expect {
          post("/v1/users", user_params("google", "123456789"))
        }.to change{ User.count }.by(1)

      expect_valid_user
    end

    it "attaches a twitter login to a logged in user" do
      user.save!
      mock_auth("Twitter", name: user.name, provider_id: "123456789")

      expect {
        api_post "/v1/users", user, user_params("twitter", "123456789")
        }.to_not change{ User.count }

      expect_valid_user
      expect(user.reload.twitter_id).to eq "123456789"
    end

    it "logs in with a duplicate registration attempt" do
      user.google_id = "123456789"
      user.save!

      mock_auth("Google", name: user.name, provider_id: "123456789")

      expect {
        post "/v1/users", user_params("google", "123456789")
        }.to_not change{ User.count }

      expect_valid_user
    end

  end

  describe "updating users" do

    it "updates an email address" do
      api_put "/v1/users/#{user.id}", user, user: { email: "floop@doop.com" }
      user.reload
      expect(user.email).to eq "floop@doop.com"
    end

    it "errors with an invalid email address" do
      api_put "/v1/users/#{user.id}", user, user: { email: "floop" }
      expect(response.body).to match(/invalid/)
    end

    it "errors with a duplicate email address" do
      create(:user, :google, email: "floop@doop.com")
      api_put "/v1/users/#{user.id}", user, user: { email: "floop@doop.com" }
      expect(response.body).to match(/already been taken/)
    end

    it "updates other fields even if email is blank" do
      api_put "/v1/users/#{user.id}", user, user: { email: "", name: "Flooperpants" }
      user.reload
      expect(user.name).to eq "Flooperpants"
    end

    it "updates expertise tags" do
      api_put "/v1/users/#{user.id}", user, user: { expertise_tags: [" Math","5th    Grade","Geometry"] }

      user.reload
      expect(user.expertise_tags).to eq ["5th grade","geometry","math"]
    end

    it "updates grade levels" do
      grade_levels = %w(Pre-K K 1st 12th)

      api_put "/v1/users/#{user.id}", user, user: { grade_levels: grade_levels }
      expect(user.reload.grade_levels).to eq grade_levels
    end

    it "updates the avatar" do
      api_put "/v1/users/#{user.id}", user, user: {
        avatar: Rack::Test::UploadedFile.new(
          Rails.root.join("spec/fixtures/pixel.png"))
      }

      expect(user.reload.profile_photo_url).to match /avatar.png$/
    end
  end

  it "includes collaborating collections" do
    collaboration = create :collaboration, :active
    collaborator = collaboration.collaborator
    collection = collaboration.collaboratable

    api_get "/v1/users/#{collaborator.id}", collaborator
    collections = json_response.fetch("collections")

    expect(collaboration.user).to eq(collection.user)
    expect(collaborator).not_to eq(collection.user)
    expect(collections.size).to eq(1)
    expect(collections.first.fetch("id")).to eq(collection.id)
  end

  describe "connecting social networks" do
    let(:provider_id) { "123456789"}

    def user!(provider)
      mock_auth(provider.capitalize, provider_id: provider_id)
      create :user, "#{provider.downcase}_id": provider_id
    end

    it "connects twitter" do
      mock_auth("Twitter", provider_id: provider_id)
      api_put "/v1/users/#{user.id}/connect", user, { provider_token: provider_id, provider: "twitter" }

      expect_response_code_of 200
      expect(json_response["twitter"]).to eq true
    end

    it "doesn't allow another to connect you" do
      mock_auth("Twitter", provider_id: provider_id)
      api_put "/v1/users/#{user.id}/connect", other, { provider_token: provider_id, provider: "twitter" }

      expect_response_code_of 403
    end
  end

  context "with a vif_demo_user" do
    let(:demouser) { create :user, flags: {"vif_demo_user":true} }
    let(:demo_learner_id) { "864ef2c1-1e20-4b3c-8202-3b47e244a47c" }

    it "returns demo data for a demo user" do
      api_get "/v1/users/#{demo_learner_id}/learnings", demouser
      expect(json_response["id"]).to eq demo_learner_id
    end
  end


end

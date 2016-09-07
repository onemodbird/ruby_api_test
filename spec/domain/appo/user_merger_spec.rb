require "rails_helper"

RSpec.describe Appo::Utils::UserMerger do
  let!(:from_user) { create :user, :facebook }
  let!(:to_user) { create :user, :registered }

  def merge!(from = from_user, to = to_user)
    merger = Appo::Utils::UserMerger.new(from: from.id, to: to.id)
    merger.merge!
  end

  it "fails if we have more recent migrations" do
    expect(ActiveRecord::Migrator).to receive(:current_version)
      .and_return(Appo::Utils::UserMerger::LATEST_MIGRATION_CHECK - 1)

    expect{merge!}.to raise_error(RuntimeError)
  end

  it "fails if we attempt to merge an expert user" do
    expert_user = create :user, { roles: ["expert"] }

    expect{merge!(expert_user)}.to raise_error(RuntimeError)
  end

  it "removes the old user" do
    merge!
    expect(User.count).to eq 1
    expect(User.first).to eq to_user
  end

  it "moves user attributes onto the new user" do
    merge!
    expect(to_user.reload.merged_users.count).to eq 1
    expect(to_user.reload.merged_users.first["id"]).to eq from_user.id
  end

  context "with a couple collections" do
    let!(:from_collection) { create(:collection, :with_resources, user: from_user) }
    let!(:to_collection) { create(:collection, :with_resources, user: to_user) }

    it "re-assaigns collections" do
      merge!
      expect(Collection.all.pluck(:user_id).uniq).to eq [to_user.id]
    end
  end

  context "with jsonb resource reviews" do
    let!(:review) { create :review, user_id: from_user.id }
    let(:resource) { review.resource }

    it "re-assigns embedded review data" do
      merge!
      expect(resource.reload.reviews.first.fetch("user_id")).to eq(to_user.id)
    end
  end
end

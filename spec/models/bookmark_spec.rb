require "rails_helper"

RSpec.describe Bookmark, type: :model do

  let(:bookmark) { create :bookmark }

  it "passes validations" do
    expect(bookmark.valid?).to eq(true)
  end

  it "requires user and url" do
    bookmark = Bookmark.new
    bookmark.valid?

    expect(bookmark.errors.keys).to include(:user_id)
    expect(bookmark.errors.keys).to include(:url)
    expect(bookmark.errors.keys).to include(:normalized_url)
  end

end

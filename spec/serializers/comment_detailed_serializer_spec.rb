require "rails_helper"

describe CommentDetailedSerializer do
  let(:user) { create :user }
  let(:collection) { create :collection, user: user }
  let(:comment) { create :comment, user: user, commentable: collection }

  let(:serialized) do
    CommentDetailedSerializer.serialize(comment)
  end

  it "includes collection data" do
    expect(serialized[:collection][:name]).to eq collection.name
  end
end

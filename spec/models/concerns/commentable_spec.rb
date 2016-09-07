require "rails_helper"

describe Commentable do
  let(:collection) { create :collection, name: "comment collection" }
  let(:user) { create :user, :registered }

  it "fails if not commentable" do
    expect{ Commentable.class_for(:not_commentable) }
      .to raise_error(RuntimeError, /NotCommentable is not a Commentable/)
  end

  it "fails when missing" do
    expect { Commentable.find(:collection, 1234) }
      .to raise_error(ActiveRecord::RecordNotFound)
  end

  it "finds a commentable" do
    expect(Commentable.find(:collection, collection.id)).to eq collection
  end
end

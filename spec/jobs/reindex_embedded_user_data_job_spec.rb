require "rails_helper"

RSpec.describe ReindexEmbeddedUserDataJob, type: :job do

  def update_user(user)
    user.update(name: "#{user.name}x")
  end

  it "reindexes resources that have been reviewed by the user" do
    review = create :review
    expect(review.resource.class).to receive(:index!).with(review.resource.id)
    update_user(review.user)
  end

  it "reindexes collections that belong to the user" do
    collection = create :collection
    expect(collection.class).to receive(:index!).with(collection.id)
    update_user(collection.user)
  end

  it "reindexes collections where the user is a collaborator" do
    collaboration = create :collaboration, :active
    expect(collaboration.collaboratable.class)
      .to receive(:index!).with(collaboration.collaboratable.id)

    update_user(collaboration.collaborator)
  end

end

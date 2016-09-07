require "rails_helper"

RSpec.describe ImportProfilePhotoAsAvatarJob, type: :job do

  let(:profile_photo_url) { "http://example.com/avatar.jpg" }

  it "sets the avatar using the profile photo" do
    user = create :user, profile_photo_url: profile_photo_url

    expect(User).to receive(:find).and_return(user)
    expect(user).to receive(:remote_avatar_url=).with(profile_photo_url)
    expect(user).to receive(:save!)

    ImportProfilePhotoAsAvatarJob.new.perform(user.id)
  end

  it "is a no-op when the user already has an avatar" do
    user = create :user, :with_avatar, profile_photo_url: profile_photo_url

    expect(User).to receive(:find).and_return(user)
    expect(user).not_to receive(:remote_avatar_url=)

    ImportProfilePhotoAsAvatarJob.new.perform(user.id)
  end

  it "is a no-op when there's no profile photo" do
    user = create :user, profile_photo_url: nil

    expect(User).to receive(:find).and_return(user)
    expect(user).not_to receive(:remote_avatar_url=)

    ImportProfilePhotoAsAvatarJob.new.perform(user.id)
  end
end

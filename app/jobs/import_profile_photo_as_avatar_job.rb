class ImportProfilePhotoAsAvatarJob
  include Sidekiq::Worker
  sidekiq_options queue: "import", retry: false

  def perform(user_id)
    user = User.find(user_id)

    return if has_avatar?(user) || missing_profile_photo?(user)

    user.remote_avatar_url = user.profile_photo_url
    user.save!
  end

  private

  def has_avatar?(user)
    !user.avatar.file.nil?
  end

  def missing_profile_photo?(user)
    user.profile_photo_url.blank?
  end

end

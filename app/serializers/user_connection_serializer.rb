class UserConnectionSerializer < BaseSerializer
  attributes :facebook, :twitter, :google

  def facebook
    object.facebook_id.present?
  end

  def twitter
    object.twitter_id.present?
  end

  def google
    object.google_id.present?
  end
end

class UserSessionSerializer < BaseSerializer
  NEW_THRESHOLD = 60.seconds

  attributes :id, :auth_token, :collections, :recent_chats, :facebook_id, :twitter_id,
    :name, :email, :profile_photo_url, :created_at, :is_new, :has_password, :superuser,
    :assignments_count, :organization_users, :vifadmin

  def collections
    CollectionSimpleSerializer.list object.editable_collections.order('LOWER(name)')
  end

  def recent_chats
    SubscriptionSerializer.list object.subscriptions.where(subscribable_type: "Chat").order(updated_at: :desc).limit(10)
  end

  def created_at
    object.created_at.to_i
  end

  def is_new
    object.new_record? || Time.now < object.created_at + NEW_THRESHOLD
  end

  def has_password
    object.encrypted_password.present?
  end

  def assignments_count
    object.assignments.count
  end

  def vifadmin
    object.organization_users.any? do |ou|
      ou.organization_id == Appo::Constants::VIF_ORG_ID &&
      ou.role == "admin"
    end
  end

  def organization_users
    if Demo::VifDemoUser.intercept?(object)
      [Demo::VifDemoUser.organization_user]
    else
      OrganizationUserSerializer.list(object.organization_users)
    end
  end
end

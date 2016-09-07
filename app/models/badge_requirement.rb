class BadgeRequirement < ActiveRecord::Base
  CREATED_RESOURCE_KINDS = ["learning_product", "artifact"]

  belongs_to :resource
  belongs_to :badge

  validates :interaction_key, :interaction_kind, :created_resource_kind,
    :resource, :badge, presence: true

  validates :created_resource_kind, inclusion: { in: CREATED_RESOURCE_KINDS }

  def earn!(user, artifact = nil)
    if user.earned_badge?(badge)
      ErrorNotification.notify("User #{user.id} able to re-earn badge #{badge.id} via requirement #{self.id}")
      nil
    else
      assertion = user.badge_assertions.create! badge_id: badge.id,
        badge_requirement_id: id,
        artifact_id: artifact.try(:id)
      track_earning user
      assertion
    end
  end

  def track_earning(user)
    data = {
      resource_id: resource.id,
      resource_name: resource.name,
      interaction: interaction_key,
      badge: BadgeSerializer.serialize(badge)
    }

    Tracking.track :badge_earned, user: user, data: data
  end
end

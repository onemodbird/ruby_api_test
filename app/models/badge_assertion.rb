class BadgeAssertion < ActiveRecord::Base
  belongs_to :badge
  belongs_to :user
  belongs_to :organization
  belongs_to :badge_requirement
  belongs_to :artifact, class_name: "Resource"

  validates :badge, :user, presence: true
end

class Organization < ActiveRecord::Base
  has_many :organization_users
  has_many :users, through: :organization_users

  validates :name, :salesforce_id, :type, presence: true

  scope :no_parent, -> do
    where("type = 'State' or (type = 'District' and state_id is NULL)")
  end

  def self.passport_whole_schools
    Organization.where(salesforce_id: Appo::Constants::PASSPORT_WHOLE_SCHOOLS)
  end

  def learners
    User.joins(:organization_users)
      .where(organization_users: {
        organization: schools,
        role: :learner
      })
  end

  def admins
    User.joins(:organization_users)
      .where(organization_users: {
        organization_id: ids_with_superorg,
        role: :admin
      })
  end

  def is_admin?(user)
    OrganizationUser.exists?(
      organization_id: ids_with_superorg,
      role: :admin,
      user_id: user.id
      )
  end

  def assign(assignable)
    unassigned_learners = learners.where.not(
        id: Assignment.where(assignable_id: assignable.id).select(:user_id)
      )

    transaction do
      unassigned_learners.each do |user|
        user.assign(assignable)
      end
    end
  end

  def add_user(user, role = :learner)
    user.tap do |user|
      organization_users.find_or_create_by!(user_id: user.id, role: role)
    end
  end

  def badge_assertions
    BadgeAssertion.where(organization: schools)
  end

  def assignments
    Assignment.where(user: learners).includes(:assignable)
  end

  def descendants(include_self = false)
    self_clause = include_self ? "id = :id OR " : ""
    Organization.where("#{self_clause}state_id = :id OR district_id = :id", id: id)
  end

  private

  # For now a superuser will be represented by an organization_user
  # with a nil organization_id and an admin role
  def ids_with_superorg
    [id, district_id, state_id, Appo::Constants::VIF_ORG_ID].compact
  end
end

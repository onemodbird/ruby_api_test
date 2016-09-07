class OrganizationUser < ActiveRecord::Base
  ROLES = %w(admin learner)

  validates_inclusion_of :role, in: ROLES

  before_validation :assign_default_role, on: :create

  belongs_to :user
  belongs_to :organization

  def assign_default_role
    self.role ||= "learner"
  end
end


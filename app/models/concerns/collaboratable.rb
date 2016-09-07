module Collaboratable
  extend ActiveSupport::Concern

  included do
    has_many :collaborations, as: :collaboratable, dependent: :destroy
    has_many :collaborators,
             -> { where("collaborations.status = 'active'") },
             through: :collaborations
  end

  def collaborator?(user)
    collaborations.where(collaborator_id: user.id, status: "active").exists?
  end

  def all_collaborators
    [user] + collaborators
  end
end

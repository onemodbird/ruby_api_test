class LearnerSerializer < BaseSerializer

  attributes :id, :name, :email, :school_ids, :assignments_count

  has_many :badge_assertions

  def assignments_count
    object.assignments.length
  end

  def school_ids
    object.organization_users.map(&:organization_id)
  end

end

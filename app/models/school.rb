class School < Organization
  belongs_to :state
  belongs_to :district

  def schools
    School.where(id: id)
  end

  def learners
    users.where(organization_users: { role: :learner })
  end
end

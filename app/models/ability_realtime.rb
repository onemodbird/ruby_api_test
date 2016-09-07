class AbilityRealtime
  include CanCan::Ability

  def initialize(user)
    return false unless user

    can :read, Collection do |collection|
      collection.user_id == user.id || collection.collaborator?(user)
    end
    can :read, User, id: user.id
  end
end

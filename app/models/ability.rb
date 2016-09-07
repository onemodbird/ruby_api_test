class Ability
  include CanCan::Ability

  attr_reader :user

  def initialize(user)
    @user = user

    all_users

    if user
      bookmarks
      assignments
      chats
      collaborations
      collections
      collection_groups
      comments
      dashboard
      notifications
      organization
      resources
      reviews
      scheduled_messages
      transcripts
      users
    end
  end

  def all_users
    can :read, User
    can :read, Resource, visibility: %w(public hidden)
    can :read, Collection, visibility: %w(public hidden)
  end

  def assignments
    can :manage, Assignment do |assignment|
      user.can_administer?(assignment.user)
    end
  end

  def bookmarks
    can :manage, Bookmark, user_id: user.id
  end

  def chats
    can :update, Chat do |chat|
      chat.is_moderator?(user)
    end
  end

  def collaborations
    can :confirm, Collaboration
    can :manage, Collaboration, user_id: user.id
  end

  def collections
    can :read, Collection do |collection|
      collection.collaborator?(user) ||
        %w(public hidden).include?(collection.visibility)
    end
    can :create, Collection
    can [:update, :comment], Collection do |collection|
      collection.collaborator?(user)
    end
    can :manage, Collection, user_id: user.id
  end

  def collection_groups
    can :manage, CollectionGroup, user_id: user.id
  end

  def comments
    can :manage, Comment, user_id: user.id
  end

  def dashboard
    can :read, :dashboard
  end

  def notifications
    can :manage, Notification, user_id: user.id
  end

  def organization
    can :manage, Organization do |organization|
      organization.is_admin?(user)
    end
  end

  def resources
    can [:create, :comment], Resource
    can [:read, :update], Resource, user_id: user.id
    can :read, Resource do |resource|
      resource.protected? && resource.is_assigned_to?(user)
    end

    if user.has_role?("content_creator")
      can :manage, Resource
    end
  end

  def reviews
    can :create, Review
    can :update, Review, user_id: user.id
  end

  def scheduled_messages
    can :manage, ScheduledMessage, user_id: user.id
  end

  def transcripts
    can :manage, Transcript, user_id: user.id
  end

  def users
    can [:read, :update], User, id: user.id
    can :assign, User do |learner|
      user.can_administer?(learner)
    end
  end
end

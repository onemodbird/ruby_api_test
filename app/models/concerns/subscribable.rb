module Subscribable
  extend ActiveSupport::Concern
  extend ClassLookups

  def self.allowed_types
    [Chat, Collection, User, Resource]
  end

  included do
    has_many :subscriptions, dependent: :destroy, as: :subscribable
  end

  def subscribe(user_id)
    return if user_id == Appo::Constants::NIL_UUID

    subscription = Subscription.find_or_initialize_by(subscribable: self, user_id: user_id)
    subscription.update(updated_at: Time.now)

    subscription
  end

  def unsubscribe(user_id)
    return if user_id == Appo::Constants::NIL_UUID
    if subscription = Subscription.find_by(subscribable: self, user_id: user_id)
      subscription.destroy
    end
  end

  def unsubscribe_all
    Subscription.where(subscribable_id: id).destroy_all
  end

  def subscribers
    Subscription.where(subscribable: self).joins(:user).map(&:user)
  end

  def subscriber?(user_id)
    Subscription.where(subscribable: self, user_id: user_id).exists?
  end
end


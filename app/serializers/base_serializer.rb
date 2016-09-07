class BaseSerializer < ActiveModel::Serializer
  include Serialization::Serializable

  def current_user
    scope.try(:current_user)
  end

  def user
    UserSimpleSerializer.new(object.user, scope: scope).serializable_hash
  end

  def serialize_object(object)
    return nil if object.nil?
    serializer = "#{object.class}Serializer".constantize
    serializer.serialize(object)
  end

  def serialize_with_user(object, serializer)
    serializer.new(object).serializable_hash.merge(user.except(:id))
  end

  def can?(*params)
    !!(current_user && current_user.can?(*params))
  end

  def created_at_i
    object.created_at.to_i
  end

  def updated_at_i
    object.updated_at.to_i
  end

  def permissions
    perms = []
    perms << "edit" if can?(:update, object)
    perms << "destroy" if can?(:destroy, object)
    perms << "manage" if can?(:manage, object)
    perms
  end

  def subscribed
    return false if current_user.nil?
    current_user.subscribed_to? object
  end
end

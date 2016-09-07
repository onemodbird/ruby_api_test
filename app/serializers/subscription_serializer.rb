class SubscriptionSerializer < BaseSerializer
  TYPE_SERIALIZERS = {
    user: UserSimpleSerializer,
    chat: ChatSimpleSerializer
  }

  attributes :id, :created_at_i, :updated_at_i

  def attributes
    type = object.subscribable_type.downcase
    serializer = TYPE_SERIALIZERS[type.to_sym] ||
      "#{object.subscribable_type}Serializer".constantize

    super.merge(type.to_sym => serializer.serialize(object.subscribable))
  end
end

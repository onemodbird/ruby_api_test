class NotificationSerializer < BaseSerializer
  TYPE_SERIALIZERS = {
    collaboration: CollaborationSerializer,
    comment: CommentDetailedSerializer,
    collection: CollectionSimpleSerializer,
    resource: ResourceSimpleSerializer,
    collection_resource: CollectionResourceSimpleSerializer,
    acceptor: UserSimpleSerializer
  }

  attributes :id, :key, :params, :acknowledged, :created_at_i

  def attributes
    hash = super

    TYPE_SERIALIZERS.each do |attribute, serializer|
      if nested_object = object.public_send(attribute)
        hash[attribute] = serializer.serialize(nested_object)
      end
    end

    hash
  end
end

class CollectionResourceSimpleSerializer < BaseSerializer
  attributes :id, :user, :description, :collection, :resource

  def collection
    CollectionSimpleSerializer.serialize(object.collection)
  end

  def resource
    ResourceSimpleSerializer.serialize(object.resource)
  end
end

class CollectionResourceDecoratorSerializer < BaseSerializer
  def serializable_hash
    hash = ResourceSimpleSerializer.new(object.resource, scope: scope).serializable_hash

    if object.description.present?
      hash[:collection_description] = object.description
    end

    hash
  end
end

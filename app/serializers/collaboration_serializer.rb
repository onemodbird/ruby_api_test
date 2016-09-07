class CollaborationSerializer < BaseSerializer

  attributes :id, :user_id, :collaboratable_type, :collaboratable_id
  attributes :status, :email, :collaborator_id, :collaborator

  def attributes
    hash = super

    if object.collaboratable_type == "Collection"
      hash[:collection] =
        CollectionSimpleSerializer.serialize(object.collaboratable)
    end

    hash
  end

  def collaborator
    UserSimpleSerializer.serialize(object.collaborator)
  end

end

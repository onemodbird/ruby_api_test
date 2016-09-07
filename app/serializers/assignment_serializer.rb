class AssignmentSerializer < BaseSerializer
  TYPE_SERIALIZERS = {
    collection: CollectionAssignmentSerializer,
    resource: ResourceAssignmentSerializer
  }

  attributes :id, :created_at_i, :assignable_type, :assignable, :user_id

  def assignable
    assignable_serializer.serialize(object.assignable, object)
  end


  private

  def assignable_serializer
    TYPE_SERIALIZERS[object.assignable_type.downcase.to_sym]
  end
end

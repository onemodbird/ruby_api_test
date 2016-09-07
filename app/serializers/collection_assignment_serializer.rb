class CollectionAssignmentSerializer < BaseSerializer
  attributes :id, :name, :description, :timestampi, :resources, :resources_count, :user, :updated_at

  def initialize(collection, assignment)
    @object = collection
    @assignment = assignment
  end

  def resources
    object.resources.map do |resource|
      ResourceAssignmentSerializer.serialize(resource, @assignment)
    end
  end
end

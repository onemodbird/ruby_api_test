class ResourceAssignmentSerializer < BaseSerializer

  attributes :id, :name, :description, :state
  has_many :badges

  def initialize(resource, assignment)
    @object = resource
    @assignment = assignment
  end

  def state
    @assignment.assignment_details.find{ |detail| detail.resource_id == @object.id }.try(:state)
  end

end

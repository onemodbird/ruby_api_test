class AssignmentWithDetailSerializer < AssignmentSerializer

  attributes :id, :created_at_i, :resource, :interactions, :progress, :tasks

  def resource
    ResourceSerializer.serialize(meta[:resource], scope: scope)
  end

  def interactions
    detail.interactions
  end

  def progress
    detail.progress
  end

  def tasks
    AssignmentDetailTaskSerializer.list(detail.assignment_detail_tasks.order("created_at ASC"))
  end


  private

  def detail
    object.detail_for_resource(meta[:resource])
  end

end

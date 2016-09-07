class DashboardSerializer < BaseSerializer

  attributes :assignments, :recent_in_progress_assignment, :recent_chats, :recent_badge_assertions, :recent_collections, :recent_content

  def assignments
    AssignmentSerializer.list object.assignments
      .with_includes
      .limit(4)
  end

  def recent_in_progress_assignment
    detail = object.assignment_details.where("state = ? OR state = ?", "begin", "progress")
      .order(updated_at: :desc).first
    if detail
      assignment = { assignment: { id: detail.assignment.id }}
      ResourceAssignmentSerializer.serialize(detail.resource, detail.assignment).merge(assignment)
    else
      nil
    end
  end

  def recent_chats
    chats = object.subscriptions.where(subscribable_type: "Chat")
      .includes(:subscribable)
      .order(updated_at: :desc)
      .limit(10)
    SubscriptionSerializer.list chats
  end

  def recent_badge_assertions
    BadgeAssertionSerializer.list(object.badge_assertions.order(created_at: :desc).limit(8))
  end

  def recent_collections
    CollectionPreviewSerializer.list(object.editable_collections(false).order(updated_at: :desc).limit(6))
  end

  def recent_content
    ResourceSimpleSerializer.list(object.resources.order(updated_at: :desc).limit(6))
  end

end

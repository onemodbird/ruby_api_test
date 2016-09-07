class AssignmentDetailTaskSerializer < BaseSerializer

  attributes :id, :kind, :interaction, :data, :resource, :badge, :created_at

  def resource
    ResourceSimpleSerializer.serialize(object.resource)
  end

  def badge
    if assertion_id = data["badge_assertion_id"]
      BadgeSerializer.serialize(BadgeAssertion.find(assertion_id).badge)
    end
  end

end

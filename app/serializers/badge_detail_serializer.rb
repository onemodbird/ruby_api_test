class BadgeDetailSerializer < BadgeSerializer
  attributes :criteria_description, :hours_equivalency, :badge_assertion

  def initialize(badge, badge_assertion)
    @object = badge
    @badge_assertion = badge_assertion
  end

  def filter(keys)
    @badge_assertion ? keys : keys - [:badge_assertion]
  end

  def badge_assertion
    BadgeAssertionSerializer.serialize(@badge_assertion, false)
  end

end

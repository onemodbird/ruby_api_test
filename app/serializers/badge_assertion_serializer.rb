class BadgeAssertionSerializer < BaseSerializer
  attributes :id, :created_at, :user_id, :artifact, :evidence_url
  has_one :badge

  def initialize(badge_assertion, include_badge = true)
    @object = badge_assertion
    @include_badge = include_badge
  end

  def filter(keys)
    keys.delete(:artifact) unless @object.artifact_id
    keys.delete(:badge) unless @include_badge
    keys
  end

  def artifact
    ResourceSimpleSerializer.serialize(@object.artifact)
  end

  def evidence_url
    @object.evidence_url || @object.artifact&.link || Secrets.site_url
  end
end

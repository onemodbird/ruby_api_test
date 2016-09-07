class BadgeSerializer < BaseSerializer
  attributes :id, :name, :description, :image_url, :criteria_url

  def criteria_url
    object.link
  end
end

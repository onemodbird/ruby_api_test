class CollectionPreviewSerializer < BaseSerializer
  attributes :id, :name, :description, :timestampi, :resources, :resources_count, :user, :preview, :updated_at

  def resources
    res = object.resources.first(10)
    CollectionPreviewResourceSerializer.list(res, scope: scope)
  end

  def preview
    true
  end

end

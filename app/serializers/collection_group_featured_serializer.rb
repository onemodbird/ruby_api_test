class CollectionGroupFeaturedSerializer < BaseSerializer

  attributes :id, :name, :user, :collections

  def collections
    object.featureable_collections
  end

end

class CollectionGroupSerializer < BaseSerializer

  attributes :id, :name, :user, :collections

  def collections
    object.collection_objects
  end

end

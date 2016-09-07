module CollectionHelpers
  def assign_resources(collection, resources)
    return collection unless resources.present?

    starting_count = collection.resources_count + 1

    [resources].flatten.each_with_index do |resource, index|
      collection.collection_resources.create(user: collection.user, resource_id: resource.id, position: starting_count + index)
    end

    collection.reload
  end
end

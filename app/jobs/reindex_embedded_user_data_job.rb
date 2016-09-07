class ReindexEmbeddedUserDataJob
  include Sidekiq::Worker

  def perform(user_id)
    @user_id = user_id

    reindex_resources
    reindex_collections
  end

  private

  def reindex_resources
    resource_ids.each do |id|
      Resource.index!(id)
    end
  end

  def resource_ids
    Review.where(user_id: @user_id).distinct.pluck(:resource_id)
  end

  def reindex_collections
    collection_ids.each do |id|
      Collection.index!(id)
    end
  end

  def collection_ids
    ids = collection_ids_where_user_is_owner
    ids += collection_ids_where_user_is_collaborator
    ids.uniq
  end

  def collection_ids_where_user_is_owner
    Collection.where(user_id: @user_id).pluck(:id)
  end

  def collection_ids_where_user_is_collaborator
    Collaboration
      .where(
        collaborator_id: @user_id,
        collaboratable_type: "Collection")
      .pluck(:collaboratable_id)
  end
end

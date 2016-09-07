class CommentDetailedSerializer < CommentSerializer
  def attributes
    hash = super

    if object.commentable_type == "Collection"
      hash[:collection] =
        CollectionSimpleSerializer.serialize(object.commentable)
    end

    hash
  end
end

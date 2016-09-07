class CommentSerializer < BaseSerializer
  attributes :id, :user_id, :user, :content, :commentable_type, :created_at_i, :edited_at_i

  def edited_at_i
    object.edited_at.to_i
  end
end

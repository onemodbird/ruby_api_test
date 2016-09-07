class CommentChainSerializer < BaseSerializer
  attributes :id, :comments

  def comments
    object.comments.joins(:user).order(:created_at).map do |comment|
      CommentSerializer.new(comment).serializable_hash
    end
  end
end

module Event
  class CommentUpdated < Base
    def initialize(comment)
      @comment = comment
    end

    def process!
      send_realtime
    end

    private

    def send_realtime
      RealtimeService.publish(
        commentable,
        key,
        commentable.is_private,
        CommentSerializer.serialize(@comment))
    end

    def commentable
      @comment.commentable
    end
  end
end

module Event
  class CommentCreated < Base
    def initialize(comment)
      @comment = comment
    end

    def process!
      send_realtime
      notify_recipients
    end

    private

    def send_realtime
      RealtimeService.publish(
        commentable,
        key,
        commentable.is_private,
        CommentSerializer.serialize(@comment))
    end

    def notify_recipients
      comment_recipients.each do |user|
        next if user == @comment.user
        user.notify(key, comment_id: @comment.id)
      end
    end

    def commentable
      @comment.commentable
    end

    def comment_recipients
      commentable.comment_recipients.compact
    end
  end
end

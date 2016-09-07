class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :commentable, polymorphic: true

  after_commit :comment_created, on: :create
  after_commit :comment_updated, on: :update
  before_destroy :comment_deleted

  def edited_at
    updated_at == created_at ? nil : updated_at
  end

  private

  def comment_created
    Event.emit! :comment_created, self
  end

  def comment_deleted
    Event.emit! :comment_deleted, self
    Notification.destroy(comment_id: id)
  end

  def comment_updated
    Event.emit! :comment_updated, self
  end
end

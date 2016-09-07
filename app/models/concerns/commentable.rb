module Commentable
  extend ActiveSupport::Concern
  extend ClassLookups

  def self.allowed_types
    [Collection, Resource]
  end

  included do
    has_many :comments, dependent: :destroy, as: :commentable
  end

  def comment(user, content)
    comments.create(user: user, content: content)
  end

  def is_private
    true
  end

  def comment_recipients
    raise "Commentable must define comment recipients"
  end
end

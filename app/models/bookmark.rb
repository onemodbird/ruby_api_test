class Bookmark < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :url, :normalized_url, presence: true
end

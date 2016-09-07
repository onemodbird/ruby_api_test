class Badge < ActiveRecord::Base
  include Linkable
  mount_uploader :image, BaseUploader

  has_many :badge_assertions
end

class CollectionResource < ActiveRecord::Base
  belongs_to :user
  belongs_to :resource
  belongs_to :collection

  validates :resource, :collection, :position, presence: true
  validates_uniqueness_of :resource_id, scope: :collection_id

  before_destroy :destroy_notifications

  def destroy_notifications
    Notification.destroy(collection_resource_id: id)
  end
end

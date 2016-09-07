class Notification < ActiveRecord::Base
  belongs_to :user
  validates_presence_of :user_id, :key

  scope :unread, -> { where(acknowledged: false) }

  before_save :set_default_status, on: :create
  after_commit :queue_notification_jobs, on: :create

  def mark_as_acknowledged!
    update!(acknowledged: true)
  end

  def collaboration
    find Collaboration
  end

  def chat
    find Chat
  end

  def comment
    find Comment
  end

  def collection
    find Collection
  end

  def resource
    find Resource
  end

  def collection_resource
    find CollectionResource
  end

  def acceptor
    find User, :acceptor_id
  end

  def self.destroy(params)
    where("params @> ?", params.to_json).destroy_all
  end

  private

  def find(model, key = nil)
    key ||= "#{model.name.underscore}_id"

    @find ||= {}
    @find.fetch(key) do |key|
      id = param(key)
      @find[key] = id ? model.find_by(id: id) : nil
    end
  end

  def param(key)
    params[key.to_s] || params[key.to_sym]
  end

  def set_default_status
    self.email = nil unless user.can_email?(key)
  end

  def queue_notification_jobs
    if user.can_email?(key)
      EmailNotificationJob.perform_async(id)
    end
    RealtimeNotificationJob.perform_async(id)
  end
end

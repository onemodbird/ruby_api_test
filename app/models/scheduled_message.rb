class ScheduledMessage < ActiveRecord::Base
  include InitializeUUID

  MEGABYTE_LIMIT = 3
  REQUIRED_BUFFER = 60.seconds
  attr_accessor :image_file
  attr_reader :sendable_errors

  belongs_to :user
  belongs_to :schedule_occurrence
  belongs_to :image, class_name: "UploadedFile", foreign_key: :image_id, autosave: true
  validates_associated :image, message: "cannot be larger than #{MEGABYTE_LIMIT}MB"

  validate :require_buffer
  before_validation :create_uploaded_file, if: -> { image_file.present? }
  before_create :schedule_job

  scope :active, -> { where(canceled_at: nil, completed_at: nil) }

  def scheduled_at=(value)
    self[:scheduled_at] = value.is_a?(Numeric) ? Time.at(value) : value
  end

  def has_image?
    image_id.present?
  end

  def image_stream
    open(image.url)
  end

  def complete?
    completed_at.present?
  end

  def canceled?
    canceled_at.present?
  end

  def replace(params = {})
    replacement = nil

    transaction do
      replacement = ScheduledMessage.create(
        self.attributes.except("id").merge(params))

      cancel if replacement.persisted?
    end

    replacement
  end

  def cancel
    update_attribute(:canceled_at, Time.now)
  end

  def user?
    user_id.present?
  end

  def sendable?
    @sendable_errors = []

    if user? && user.twitter_auth_token.nil?
      @sendable_errors <<  "Twitter Auth Token not set"
    end

    if chat_promo_id?
      if !schedule_occurrence
        @sendable_errors << "Scheduled occurrence not found"
      elsif !schedule_occurrence.schedulable.promos_enabled?
        @sendable_errors << "Promos disabled for chat"
      end
    end

    if canceled_at?
      @sendable_errors << "Canceled"
    end

    @sendable_errors.empty?
  end

  private

  def require_buffer
    unless is_in_future?
      errors.add(:scheduled_at, "must be at least 1 minute from now")
    end
  end

  def is_in_future?
    scheduled_at - Time.now >= REQUIRED_BUFFER
  end

  def create_uploaded_file
    build_image file: image_file, user_id: user_id, megabyte_limit: MEGABYTE_LIMIT
  end

  def schedule_job
    if Secrets.scheduled_messages.enabled
      self.job_id = ScheduledMessageSendJob.perform_at(scheduled_at, id)
    end
  end
end

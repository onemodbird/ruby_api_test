class ChatPromo < ActiveRecord::Base
  SCHEDULE_BUFFER   = 5.minutes
  LOOK_BEHIND_LIMIT = 2.hours
  FUTURE_TIME_LIMIT = 1.days

  attr_accessor :image_file

  has_many :scheduled_promos
  belongs_to :image, class_name: "UploadedFile", foreign_key: :image_id

  scope :enabled, -> { where(disabled_at: nil) }
  before_validation :create_uploaded_file, if: -> { image_file.present? }
  after_create :generate

  def self.generate
    enabled.each { |promo| promo.generate }
  end

  def has_image?
    image_id.present?
  end

  def generate
    promos_to_schedule.each do |occurrence|
      # TODO image_id
      content = process_message_text(text, occurrence.schedulable)
      next unless TwitterService.length_valid?(content)

      process_message_times(occurrence).map do |time|
        ScheduledPromo.create!(
          text: content,
          scheduled_at: time,
          chat_promo_id: id,
          schedule_occurrence_id: occurrence.id,
          image: image
        )
      end
    end
  end

  def promos_to_schedule
    ScheduleOccurrence
      .between(Time.now - LOOK_BEHIND_LIMIT, Time.now + FUTURE_TIME_LIMIT)
      .where(chats: { promos_enabled: true } )
      .where("not exists (select * from scheduled_messages where
        scheduled_messages.schedule_occurrence_id = schedule_occurrences.id
        and scheduled_messages.chat_promo_id = ?)", id)
  end

  def process_message_text(text, chat)
    text = text % {
      hashtag: chat.name,
      chat_url: chat.url
    }
  end

  def process_message_times(occurrence)
    times = case kind.to_s
    when "start"
      [occurrence.start_time + time_offset.minutes]
    when "end"
      [occurrence.end_time + time_offset.minutes]
    when "recurring"
      recurrence = ((occurrence.end_time - occurrence.start_time) / 60 / time_offset).floor
      recurrence.times.map do |time|
        occurrence.start_time + ((time + 1) * time_offset).minutes
      end
    end

    times.reject { |time| time < Time.now + SCHEDULE_BUFFER }
  end

  def disable
    transaction do
      scheduled_promos.update_all(canceled_at: Time.now)
      update_attribute(:disabled_at, Time.now)
    end
  end

  def create_uploaded_file
    self.image = UploadedFile.create!(
      file: image_file, user_id: Appo::Constants::NIL_UUID, megabyte_limit: ScheduledMessage::MEGABYTE_LIMIT)
  end
end

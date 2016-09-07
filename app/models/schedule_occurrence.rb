class ScheduleOccurrence < ActiveRecord::Base
  TRANSCRIPT_MESSAGE_THRESHOLD = 10

  belongs_to :schedulable, polymorphic: true
  has_one :chat_occurrence_summary

  has_many :scheduled_promos
  after_create :schedule_jobs

  scope :enabled, -> { where(canceled: false) }

  def self.calendar_view
    start_at = Time.zone.now.beginning_of_week(:sunday)
    end_at = start_at + 4.weeks

    enabled.between(start_at - 2.days, end_at + 2.days)
  end

  def self.chats
    where(schedulable_type: "Chat")
      .joins("JOIN chats ON chats.id = schedule_occurrences.schedulable_id")
      .where(chats: { archived_at: nil })
  end

  def self.between(start_at, end_at, include_in_progress = false)
    chats.where("#{include_in_progress ? 'end_time' : 'start_time'} > ?", start_at)
      .where("start_time <= ?", end_at)
  end

  def schedule_jobs
    # Schedules a call to on_start and on_complete for the instance
    ScheduleOccurrenceStartJob.perform_at(start_time, id)
    ScheduleOccurrenceCompleteJob.perform_at(end_time, id)
  end

  def cancel
    update_attribute(:canceled, true)
  end

  def achieved_transcript_threshold?
    message_count = schedulable.chat_messages
      .retweet(false).before(end_time).after(start_time).count

    message_count >= TRANSCRIPT_MESSAGE_THRESHOLD
  end

  # Events: Note these will happen async

  def on_start
    # Nothing yet
  end

  def on_complete
    if achieved_transcript_threshold?
      ChatOccurrenceSummary.generate(self)
    else
      cancel
    end
  end
end

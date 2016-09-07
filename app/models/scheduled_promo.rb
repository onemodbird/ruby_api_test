class ScheduledPromo < ScheduledMessage
  belongs_to :chat_promo
  belongs_to :scheduled_occurrence

  def self.for_occurrences(*occurrences)
    where(schedule_occurrence_id: [occurrences].flatten)
  end
end

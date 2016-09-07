class ChatSerializer < ChatSimpleSerializer
  include Serialization::Moderators
  attributes :moderators, :schedule_occurrences, :schedule, :archived_at

  def schedule
    object.schedule&.to_hash
  end

  def schedule_occurrences
    ScheduleOccurrenceEmbeddedSerializer.list(
      object.schedule_occurrences.enabled
        .between(Time.now, Time.now + 3.months, true)
        .order(:start_time)
      )
  end
end

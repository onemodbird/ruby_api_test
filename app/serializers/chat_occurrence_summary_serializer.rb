class ChatOccurrenceSummarySerializer < BaseSerializer
  include Serialization::Moderators
  attributes :id, :transcript_id, :analytics, :moderators, :schedule_occurrence

  def schedule_occurrence
    ScheduleOccurrenceEmbeddedSerializer.serialize(object.schedule_occurrence)
  end
end

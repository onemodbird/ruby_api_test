class ScheduleOccurrenceSerializer < BaseSerializer
  attributes :id, :schedulable_id, :schedulable_type, :start_time, :end_time
end

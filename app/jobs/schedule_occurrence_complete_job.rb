class ScheduleOccurrenceCompleteJob
  include Sidekiq::Worker
  sidekiq_options queue: :default, retry: 1 # Only retry once (between 15 and 45 seconds late)

  def perform(schedule_occurrence_id)
    if schedule_occurrence = ScheduleOccurrence.find_by(id: schedule_occurrence_id)
      schedule_occurrence.on_complete
    end
  end
end

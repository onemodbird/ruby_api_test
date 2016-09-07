class ScheduleOccurrenceUpdateJob
  include Sidekiq::Worker

  def perform
    Schedulable.generate_occurrences
  end
end

class ScheduleOccurrenceJob
  include Sidekiq::Worker

  def perform(class_name, schedulable_id)
    instance = class_name.constantize.find(schedulable_id)
    instance.regenerate_occurrences
  end
end

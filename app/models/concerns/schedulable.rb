module Schedulable
  extend ActiveSupport::Concern

  FUTURE_TIME_LIMIT = 60.days

  def self.allowed_types
    [Chat]
  end

  def self.generate_occurrences(max_time = FUTURE_TIME_LIMIT.from_now)
    allowed_types.each do |type|
      type.where.not(schedule: nil).find_each do |instance|
        last_occurrence = ScheduleOccurrence
          .where(schedulable: instance)
          .order(start_time: :desc)
          .first

        min_time = last_occurrence ? last_occurrence.start_time : Time.zone.now
        min_time += 1

        instance.generate_occurrences(min_time, max_time)
      end
    end
  end

  def self.regenerate_occurrences(max_time = FUTURE_TIME_LIMIT.from_now)
    ScheduleOccurrence.where("start_time > ?", Time.zone.now).destroy_all
    generate_occurrences(max_time)
  end

  included do
    class IceCubeSerializer
      def self.dump(ice_cube_schedule)
        return nil if ice_cube_schedule.nil?
        ice_cube_schedule.to_hash
      end

      def self.load(hash)
        return nil if hash.nil?
        IceCube::Schedule.from_hash(hash)
      end
    end

    serialize :schedule, IceCubeSerializer
    has_many :schedule_occurrences, as: :schedulable, dependent: :destroy

    attr :schedule_really_changed
    before_save :set_schedule_really_changed_flag
    after_commit :update_schedule_occurrences
  end

  (0..9).each do |i|
    define_method "schedule_rule_#{i}" do
      schedule && schedule.rrules[i]
    end
  end

  def schedule_duration
    schedule && (schedule.duration / 60).to_i
  end

  def set_schedule_really_changed_flag
    @schedule_really_changed =
      (schedule_was && schedule_was.to_hash) != (schedule && schedule.to_hash)
    true # don't abort the save when unchanged
  end

  def update_schedule_occurrences
    return unless schedule_really_changed
    ScheduleOccurrenceJob.perform_async(self.class.name, id)
  end

  def generate_occurrences(min_time = Time.zone.now,
                           max_time = FUTURE_TIME_LIMIT.from_now)
    return if schedule.nil?

    schedule.occurrences_between(min_time, max_time).each do |t|
      next if t == schedule.start_time

      schedule_occurrences.create!(
        start_time: t,
        end_time: t + schedule.duration)
    end
  end

  def regenerate_occurrences
    future_occurrences.destroy_all
    generate_occurrences
  end

  def future_occurrences
    schedule_occurrences.where("start_time > ?", Time.zone.now)
  end
end

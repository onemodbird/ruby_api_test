module Schedulable
  module Params
    class << self
      def apply(schedulable, params)
        keys = [:schedule_duration, :schedule_times, :schedule_rules,
                :schedule_single_occurrence_dates,
                :schedule_single_occurrence_times]
        return unless (params.keys.map(&:to_sym) & keys).any?

        remove_blank_schedule_rules(params)
        remove_blank_schedule_times(params)
        remove_hours_minutes_and_seconds_from_rules(params)
        remove_blank_single_occurrence_dates_and_times(params)

        unless schedule_params_are_present?(params)
          schedulable.schedule = nil
          return
        end

        fix_dirty_checking(schedulable)

        schedulable.schedule ||= IceCube::Schedule.new(Time.zone.now)

        assign_new_duration(schedulable.schedule, params)

        remove_existing_recurrence_rules(schedulable.schedule)
        rebuild_recurrence_rules(schedulable.schedule, params)

        remove_existing_recurrence_times(schedulable.schedule)
        rebuild_single_occurrences(schedulable.schedule, params)
      end

      private

      def schedule_params_are_present?(params)
        params[:schedule_rules].present? ||
          params[:schedule_single_occurrence_dates].present?
      end

      def remove_blank_single_occurrence_dates_and_times(params)
        Array(params[:schedule_single_occurrence_dates]).reject!(&:blank?)
        Array(params[:schedule_single_occurrence_times]).reject!(&:blank?)
      end

      def remove_blank_schedule_times(params)
        Array(params[:schedule_times]).reject!(&:blank?)
      end

      def remove_blank_schedule_rules(params)
        Array(params[:schedule_rules]).reject! do |rule|
          rule.blank? || rule == "null"
        end
      end

      def remove_hours_minutes_and_seconds_from_rules(params)
        Array(params[:schedule_rules]).map! do |rule|
          hash = JSON.parse(rule)
          if hash["validations"]
            hash["validations"].except!(*%w(
              hour_of_day
              minute_of_hour
              second_of_minute))
          end
          hash
        end
      end

      def fix_dirty_checking(schedulable)
        ## seems like a no-op, but fixes dirty checking which is sketchy
        schedulable.schedule = schedulable.schedule
      end

      def assign_new_duration(schedule, params)
        schedule.duration = params[:schedule_duration].to_i * 60
      end

      def remove_existing_recurrence_rules(schedule)
        schedule.recurrence_rules.each do |rule|
          schedule.remove_recurrence_rule(rule)
        end
      end

      def rebuild_recurrence_rules(schedule, params)
        params[:schedule_rules].each_with_index do |rule_hash, i|
          rule = RecurringSelect.dirty_hash_to_rule(rule_hash)
          time = Time.zone.parse(params[:schedule_times][i])

          rule.hour_of_day(time.hour)
          rule.minute_of_hour(time.min)
          rule.second_of_minute(0)

          schedule.add_recurrence_rule(rule)
        end
      end

      def remove_existing_recurrence_times(schedule)
        schedule.recurrence_times.each do |time|
          schedule.remove_recurrence_time(time)
        end
      end

      def rebuild_single_occurrences(schedule, params)
        dates = Array(params[:schedule_single_occurrence_dates])
        times = Array(params[:schedule_single_occurrence_times])

        dates.zip(times).each do |date, time|
          schedule.add_recurrence_time Time.zone.parse("#{date} #{time}")
        end
      end
    end
  end
end

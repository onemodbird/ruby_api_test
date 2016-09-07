module Appo
  module ICalendar

    def generate(schedulable)
      vcalendar do |cal|
        cal << vtimezone
        cal << vevent(schedulable)
      end
    end
    module_function :generate

    class << self
      private

      def vcalendar
        [].tap do |cal|
          cal << "BEGIN:VCALENDAR"
          cal << "VERSION:2.0"
<<<<<<< HEAD
          cal << "PRODID:-//greenprint Learning//greenprintmedia.org//EN"
=======
          cal << "PRODID:-//greenprint Learning//greenprintmedia.org//EN"
>>>>>>> parent of 0bd3464... customize to greenprintmedia

          yield cal

          cal << "END:VCALENDAR"
        end
        .flatten
        .reject(&:blank?)
        .join("\r\n")
      end

      def vtimezone
        [ "BEGIN:VTIMEZONE",
          "TZID:America/Chicago",
          "BEGIN:DAYLIGHT",
          "TZOFFSETFROM:-0600",
          "TZOFFSETTO:-0500",
          "TZNAME:CDT",
          "DTSTART:19700308T020000",
          "RRULE:FREQ=YEARLY;BYMONTH=3;BYDAY=2SU",
          "END:DAYLIGHT",
          "BEGIN:STANDARD",
          "TZOFFSETFROM:-0500",
          "TZOFFSETTO:-0600",
          "TZNAME:CST",
          "DTSTART:19701101T020000",
          "RRULE:FREQ=YEARLY;BYMONTH=11;BYDAY=1SU",
          "END:STANDARD",
          "END:VTIMEZONE"]
      end

      def vevent(schedulable)
        return unless schedulable.schedule?
        return unless schedulable.schedule.recurrence_rules.present?

        [].tap do |event|
          event << "BEGIN:VEVENT"
          event << "SUMMARY:#{schedulable.name}"
          event << "UID:#{schedulable.id}@greenprintmedia.org"
          event << "DTSTAMP:#{dtstamp(schedulable)}"
          event << "DTSTART;TZID=America/Chicago:#{dtstart(schedulable)}"
          event << recurrence_rules(schedulable)
          event << "DTEND;TZID=America/Chicago:#{dtend(schedulable)}"
          event << "END:VEVENT"
        end
      end

      def dtstamp(schedulable)
        schedulable.updated_at.utc.strftime("%Y%m%dT%H%M%SZ")
      end

      def dtstart(schedulable)
        schedulable.schedule.next_occurrence.start_time.strftime("%Y%m%dT%H%M%S")
      end

      def dtend(schedulable)
        schedulable.schedule.next_occurrence.end_time.strftime("%Y%m%dT%H%M%S")
      end

      def recurrence_rules(schedulable)
        schedulable.schedule.recurrence_rules.map do |rule|
          "RRULE:#{rule.to_ical}"
        end
      end
    end
  end
end

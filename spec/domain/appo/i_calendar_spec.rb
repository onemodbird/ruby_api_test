require "rails_helper"

module Appo
  RSpec.describe ICalendar do
    let(:ics) {
      [ "BEGIN:VCALENDAR",
        "VERSION:2.0",
<<<<<<< HEAD
        "PRODID:-//greenprint Learning//greenprintmedia.org//EN",
=======
        "PRODID:-//Participate Learning//participate.com//EN",
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        "BEGIN:VTIMEZONE",
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
        "END:VTIMEZONE",
        "BEGIN:VEVENT",
        "SUMMARY:#{schedulable.name}",
        "UID:#{schedulable.id}@participate.com",
        "DTSTAMP:20160214T111111Z",
        "DTSTART;TZID=America/Chicago:20160215T110000",
        "RRULE:FREQ=WEEKLY;BYDAY=MO;BYHOUR=11;BYMINUTE=0;BYSECOND=0",
        "RRULE:FREQ=WEEKLY;BYDAY=FR;BYHOUR=19;BYMINUTE=0;BYSECOND=0",
        "DTEND;TZID=America/Chicago:20160215T120000",
        "END:VEVENT",
        "END:VCALENDAR"]
      .join("\r\n")
    }

    let(:schedulable) {
      create :chat, :with_schedule
    }

    it "generates a valid icalendar file" do
      Timecop.freeze(2016, 2, 14, 11, 11, 11)
      expect(ICalendar.generate(schedulable)).to eq(ics)
    end
  end
end


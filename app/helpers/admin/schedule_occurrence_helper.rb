module Admin::ScheduleOccurrenceHelper
  def formatted_occurrence_time(occurrence)
    occurrence.start_time.strftime("%-m/%-d %l:%M%P - ") +
    occurrence.end_time.strftime("%l:%M%P %Z")
  end
end

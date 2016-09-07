module Admin::ChatsHelper
  def rule_time_string(rule)
    hours = rule.validations_for(:hour_of_day)
    raise "A single hour is required" unless hours.size == 1

    minutes = rule.validations_for(:minute_of_hour)
    raise "A single minute is required" unless minutes.size == 1

    "%.2d:%.2d" % [hours.first.hour, minutes.first.minute]
  end

  def schedule_duration_in_minutes(schedule)
    schedule.duration.to_i / 60
  end

  def schedule_rules(chat)
    (0..9)
      .map { |i| chat.public_send("schedule_rule_#{i}") }
      .compact
  end

  def schedule_to_s(schedule)
    case
    when schedule.nil?
      "N/A"
    when schedule.rrules.any?
      schedule.to_s
    else
      schedule.to_s.split("/").drop(1).join("/")
    end
  end
end

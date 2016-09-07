require "csv"
require "pp"

class Schedule

  def self.import_using_central_timezone
    Time.use_zone("America/Chicago") do
      import
    end
  end

  def self.import
    report = { invalid: [], not_found: [], imported: [], error: [] }

    CSV.foreach(Rails.root.join("db", "chat-schedules-seed.csv")) do |row|
      data = row.take(5).map(&:to_s).map(&:strip)
      import = Import.new(*data)

      unless import.valid?
        if import.chat_name.present?
          report[:invalid] << { import.chat_name => import.errors }
        end
        next
      end

      chat = Chat.find_by(name: import.chat_name)

      unless chat
        report[:not_found] << import.chat_name
        next
      end

      begin
        chat.schedule = import.schedule
        chat.save!
        report[:imported] << import.chat_name
      rescue
        report[:error] << import.chat_name
      end
    end

    pp report
  end

  Import = Struct.new(:start_time, :end_time, :chat_name, :frequency, :weekdays) do
    def valid?
      errors << :start_time unless start_time =~ /\A\d{1,2}:\d{2}\s*(a|p)m\z/i
      errors << :end_time unless end_time =~ /\A\d{1,2}:\d{2}\s*(a|p)m\z/i
      errors << :chat_name unless chat_name =~ /\A#[a-z0-9]+\z/i
      errors << :frequency unless frequency =~ /\Aweekly|monthly\z/
      errors << :weekdays unless weekdays =~ /\A(M|Tu|W|Th|F|Sa|Su)(-\d)*(,\s*(M|Tu|W|Th|F|Sa|Su)(-\d)*)*\z/
      errors.empty?
    end

    def errors
      @errors ||= []
    end

    def start
      @start ||= Time.zone.parse(start_time)
    end

    def duration
      Time.zone.parse(end_time) - start
    end

    def schedule
      @schedule ||=
        begin
          schedule = IceCube::Schedule.new(Time.zone.now, duration: duration)
          schedule.add_recurrence_rule(rule)
          schedule
        end
    end

    def rule
      case frequency
      when "weekly" then weekly_rule
      when "monthly" then monthly_rule
      else raise "Unhandled frequency: #{frequency}"
      end
    end

    def day_map
      { "Su" => 0, "M" => 1, "Tu" => 2, "W" => 3,
        "Th" => 4, "F" => 5, "Sa" => 6 }
    end

    def days
      weekdays.split(",").map(&:strip)
    end

    def days_of_week
      days.map do |dow|
        day, *week_numbers = dow.split("-")
        [ day_map.fetch(day), week_numbers.map(&:to_i) ]
      end
      .reduce({}) do |hash, dows|
        hash[dows.first] ||= []
        hash[dows.first].concat(dows.drop(1).flatten)
        hash
      end
    end

    def weekly_rule
      IceCube::Rule
        .weekly
        .day(days.map{|wd| day_map.fetch(wd) })
        .hour_of_day(start.hour)
        .minute_of_hour(start.min)
        .second_of_minute(0)
    end

    def monthly_rule
      IceCube::Rule
        .monthly
        .day_of_week(days_of_week)
        .hour_of_day(start.hour)
        .minute_of_hour(start.min)
        .second_of_minute(0)
    end
  end
end

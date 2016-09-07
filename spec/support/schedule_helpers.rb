module Appo
  module Test
    module ScheduleHelpers
      def default_schedule_params(overrides = {})
        {
          schedule_duration: 60,
          schedule_times: ["11:00", "19:00"],
          schedule_rules: [
            { validations: { day:[1] },
              rule_type: "IceCube::WeeklyRule",
              interval: 1,
              week_start: 0 }.to_json,
            { validations: { day:[5] },
              rule_type: "IceCube::WeeklyRule",
              interval: 1,
              week_start: 0 }.to_json,
          ]
        }.merge(overrides)
      end
    end
  end
end

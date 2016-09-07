module IceCube
  class Schedule
    def ==(other)
      other.is_a?(Schedule) && (to_hash == other.to_hash)
    end
  end

  module Validations::HourOfDay
    class Validation
      def build_s(builder)
      end
    end
  end

  module Validations::MinuteOfHour
    class Validation
      def build_s(builder)
      end
    end
  end

  module Validations::SecondOfMinute
    class Validation
      def build_s(builder)
      end
    end
  end

end

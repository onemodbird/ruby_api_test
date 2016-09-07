module RecurringSelect
  class << self
    alias :original_filter_params :filter_params

    def filter_params(params)
      params = original_filter_params(params)

      params[:validations].tap do |v|
        [:hour_of_day, :minute_of_hour, :second_of_minute].each do |key|
          next unless v.key?(key)
          v[key] = v[key].map(&:to_i)
        end
      end

      params
    end
  end
end

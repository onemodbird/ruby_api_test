class Time
  # Limit time precision so that timestamps will be equal both before
  # and after a record is persisted to the database.
  # Postgres has microsecond (6 digit) precision

  @precision = 6

  class << self
    alias :original_now :now
    def now
      original_now.round(@precision)
    end

    alias :original_new :new
    def new(*args)
      original_new(*args).round(@precision)
    end
  end
end

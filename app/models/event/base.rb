module Event
  class Base
    def self.key
      @key ||= name.demodulize.underscore.to_sym
    end

    def key
      self.class.key
    end

    def process!
      # placeholder to be overridden by subclasses, also providing
      # a no-op for events that don't process themselves
    end
  end
end

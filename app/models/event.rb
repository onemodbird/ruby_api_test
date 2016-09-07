module Event
  def self.emit!(event_key, *args)
    event = fetch(event_key).new(*args)
    event.process!
  end

  def self.fetch(event_key)
    begin
      "::Event::#{event_key.to_s.camelize}".constantize
    rescue
      raise UnregisteredError.new(event_key)
    end
  end

  class UnregisteredError < StandardError ; end
end

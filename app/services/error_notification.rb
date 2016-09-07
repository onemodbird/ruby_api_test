class ErrorNotification
  def self.notify(ex, opts = {})
    if ex.is_a? Exception
      notify_exception(ex, opts)
    else
      notify_message(ex, opts)
    end
  end

  private

  def self.notify_exception(ex, opts)
    if Rails.env.development? || Rails.env.test?
      friendly_console_output(ex)
    end

    Airbrake.notify(ex, opts)
  end

  def self.notify_message(msg, opts)
    if Rails.env.development? || Rails.env.test?
      Rails.logger.error " [ErrorNotification] #{msg}"
    end

    Airbrake.notify({error_message: msg}.merge(opts))
  end

  def self.friendly_console_output(ex)
    msg = [ex.message]
    if ex.backtrace
      msg << [ex.backtrace.first(9)]
      msg << "..." if ex.backtrace.length > 9
    end
    msg = msg.flatten.join("\n")

    Rails.logger.error " [ErrorNotification] #{msg}"
  end
end


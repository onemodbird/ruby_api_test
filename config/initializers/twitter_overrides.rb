# Quoted status accessibility since it didn't exist when the gem was released
class Twitter::Tweet < Twitter::Identity
  def quoted_status_id
    attrs[:quoted_status_id]
  end

  def quoted_status
    if attrs[:quoted_status]
      Twitter::Tweet.new(attrs[:quoted_status])
    else
      nil
    end
  end
end

class ScheduledMessageSerializer < BaseSerializer
  attributes :completed_at_i,
             :created_at_i,
             :id,
             :image_url,
             :scheduled_at_i,
             :success,
             :text,
             :tweet_id

  def image_url
    object.has_image? ? object.image.url : nil
  end

  def scheduled_at_i
    object.scheduled_at.to_i
  end

  def completed_at_i
    object.complete? ? object.completed_at.to_i : nil
  end

  def success
    object.complete? && object.error.nil?
  end
end

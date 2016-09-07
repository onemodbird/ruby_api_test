class ResourceSimpleSerializer < BaseSerializer

  attributes :id, :url, :name, :image_url, :screenshot_urls, :tags, :price
  attributes :score, :review_count, :type, :kind, :free, :grade_levels
  attributes :common_core_tags, :permissions, :description, :updated_at
  attributes :author

  # TODO: allow once we have a flag for enabling / disabling
  # def filter(keys)
  #   keys - keys.select { |k|
  #     val = send(k)
  #     (val.blank? && val != false) || val == 0 || val == 0.01
  #   }
  # end

  def type
    object.content_type
  end

  def kind
    object.content_type
  end

  def free
    object.free?
  end

  def grade_levels
    object.correct_grade_levels
  end

end

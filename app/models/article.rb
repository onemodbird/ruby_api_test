class Article < ActiveRecord::Base
  include Searchable

  belongs_to :user

  INDEX_COUNTER = 1
  settings ::Searchable::SETTINGS

  def name
    title
  end

  def published?
    published_at.present?
  end

  def publish!
    update!(published_at: Time.zone.now)
  end

  def as_indexed_json options={}
    attributes.merge({
      'published' => published_at.nil? ? false : true
    })
  end

end

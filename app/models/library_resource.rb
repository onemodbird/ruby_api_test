class LibraryResource < ActiveRecord::Base
  include Searchable

  INDEX_COUNTER = 0
  settings ::Searchable::SETTINGS do
    mappings dynamic: false do
      indexes :extrafield_keyword, type: "string"
      indexes :extrafield_tags, type: "string"
      indexes :item_title, type: "string"
    end
  end

  def as_indexed_json(options = {})
    LibraryResourceSerializer.new(self).to_json
  end
end

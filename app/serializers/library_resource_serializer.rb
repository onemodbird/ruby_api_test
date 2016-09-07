class LibraryResourceSerializer < BaseSerializer

  def serializable_hash
    JSON.parse(object.json)
  end

  def as_json
    serializable_hash
  end

  def to_json
    object.json
  end

end

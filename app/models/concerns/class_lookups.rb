module ClassLookups
  def class_for(type)
    type_string = type.to_s.singularize.camelize

    if allowed_types.empty?
      return type_string.constantize if const_defined? type_string
    elsif allowed_type = allowed_types.detect{ |type| type.name == type_string }
      return allowed_type
    end

    raise "#{type_string} is not a #{name}."
  end

  def find(type, id)
    class_for(type).find(id)
  end

  def find_by_params(params)
    type_key, id = *params.detect {|key,id| key.to_s.match /_id\z/}
    find(type_key.to_s.sub(/_id\z/, ""), id)
  end

  # Override this list to limit allowed types
  def allowed_types
    []
  end

  def allowed_type_ids
    allowed_types.map{ |type| "#{type.to_s.underscore}_id".to_sym }
  end

  def allowed_type_names
    allowed_types.map{ |type| type.to_s.downcase }
  end
end

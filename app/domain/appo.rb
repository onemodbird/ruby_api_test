module Appo
  module_function

  def deep_freeze(o)
    o.freeze
    if o.respond_to?(:each)
      o.each { |o2| deep_freeze(o2) }
    end
  end
end

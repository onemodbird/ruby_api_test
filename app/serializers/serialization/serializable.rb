module Serialization
  module Serializable
    extend ActiveSupport::Concern

     module ClassMethods
      def list(objects, params = {})
        objects.map{ |object| serialize(object, params) }
      end

      def serialize(object, params = {})
        new(object, params).serializable_hash
      end
    end
  end
end

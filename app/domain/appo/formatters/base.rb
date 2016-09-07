module Appo
  module Formatters
    class Base

      def self.format(data)
        case data

        # Hash
        when Hash
          format_hash data

        # Database record
        when ActiveRecord::Base
          format_hash data.as_indexed_json

        # Elastic search result
        else
          data.fetch('_source', data).tap do |tap|
            format_hash tap
          end
        end
      end

    end
  end
end

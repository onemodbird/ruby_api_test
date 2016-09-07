module Appo
  module Formatters
    class Resource < Base

      def self.format_hash(hash)
        hash['type'] = hash.delete('content_type')
        hash.delete('kind')
        hash.delete('free')
        hash.delete('os')

        hash
      end

    end
  end
end

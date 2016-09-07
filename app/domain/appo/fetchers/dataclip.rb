module Appo
  module Fetchers
    class Dataclip

      def initialize url
        @url = url
      end

      attr_reader :url

      def records
        json_data_rows
          .map(&:first)
          .map{ |json| JSON.parse(json) }
      end

      def rows
        json_data_rows
          .map(&:first)
      end

      private

      def source_data
        Typhoeus.get(url, followlocation: true).body
      end

      def json_data
        JSON.parse(source_data)
      end

      def json_data_rows
        json_data.fetch('values')
      end

    end
  end
end

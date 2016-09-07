module Appo
  module Fetchers
    class Ibook
      def initialize(url)
        @url = url
        @id = url[%r{/id(\d+)}, 1]
      end

      def resource_data
        found? ? found_data : not_found_data
      end

      alias :update_attributes :resource_data

      private

      def found_data
        {
          "name" => ibook.fetch("trackName"),
          "price" => ibook.fetch("formattedPrice"),
          "owner" => ibook.fetch("artistName"),
          "image_url" => ibook.fetch("artworkUrl100"),
          "defunct_at" => nil
        }
      end

      def not_found_data
        {
          "defunct_at" => Time.now.utc
        }
      end

      def found?
        result.fetch("resultCount") > 0
      end

      def ibook
        @ibook ||= result.fetch("results").first
      end

      def result
        @result ||= JSON.parse(http.body)
      end

      def http
        @http ||= Typhoeus.get(api_url)
      end

      def api_url
        @api_url ||= "https://itunes.apple.com/lookup?id=#{@id}"
      end
    end
  end
end

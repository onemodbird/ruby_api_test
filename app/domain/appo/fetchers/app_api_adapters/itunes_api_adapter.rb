module Appo
  module Fetchers
    class ItunesApiAdapter
      BASE_URL = "https://itunes.apple.com/lookup"

      def self.app_data(app_store_id)
        body = call(app_store_id)
        map(body)
      rescue RestClient::ResourceNotFound
        nil
      end

      private

      def self.call(app_store_id)
        response = RestClient.get(BASE_URL, params: { id: app_store_id } )
        response.body
      end

      def self.map(body)
        data = JSON.parse(body)

        if data["resultCount"] > 0 && app = data["results"][0]
          screenshots = (
            app.fetch("screenshotUrls") +
            app.fetch("ipadScreenshotUrls")).flatten.compact

          {
            name: app.fetch("trackName"),
            price: app.fetch("formattedPrice"),
            owner: app.fetch("sellerName"),
            description: app.fetch("description"),
            image_url: proxify_icon(app.fetch("artworkUrl512")),
            defunct_at: nil,
            screenshot_urls: proxify_screenshots(screenshots)
          }
        else
          nil
        end
      end

      def self.proxify_icon(url)
        Appo::Constants::CDN_URL + "i/200/" + url
      end

      def self.proxify_screenshots(urls)
        urls.map do |url|
          Appo::Constants::CDN_URL + "s/1024/" + url
        end
      end
    end
  end
end

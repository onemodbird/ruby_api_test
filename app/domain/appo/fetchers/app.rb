require_relative "app_api_adapters/itunes_api_adapter"
require_relative "app_api_adapters/google_play_html_adapter"

module Appo
  module Fetchers
    class App
      API_ADAPTERS = {
        ios: Appo::Fetchers::ItunesApiAdapter,
        android: Appo::Fetchers::GooglePlayHtmlAdapter
      }

      UPDATABLE_ATTRIBUTES = [:name, :price, :owner, :image_url, :defunct_at, :screenshot_urls]

      def initialize(url)
        @os = Appo::ResourceKind.os(url).to_sym
        @id = Appo::ResourceKind.app_store_id(url)
      end

      def resource_data
        app_data || { defunct_at: Time.now.utc }
      end

      def update_attributes
        if app_data
          app_data.slice *UPDATABLE_ATTRIBUTES
        else
          nil
        end
      end

      private

      def app_data
        @app_data ||= API_ADAPTERS[@os].app_data(@id)
      end

    end
  end
end

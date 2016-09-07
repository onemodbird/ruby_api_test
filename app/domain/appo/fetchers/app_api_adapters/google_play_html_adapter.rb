require_relative "parsers/google_play_html_description_parser"

module Appo
  module Fetchers
    class GooglePlayHtmlAdapter
      BASE_URL = "https://play.google.com/store/apps/details"

      class << self
        def app_data(google_play_id)
          body = call(google_play_id)
          map(body)
        rescue RestClient::ResourceNotFound
          nil
        end

        private

        def call(google_play_id)
          response = RestClient.get(BASE_URL, params: { id: google_play_id } )
          response.body
        rescue ParseError => e
          raise e.exception("Error parsing Google Play page for #{google_play_id}")
        end

        def map(body)
          doc = Nokogiri::HTML(body)
          {
            name: extract_name(doc),
            price: extract_price(doc),
            owner: extract_owner(doc),
            description: extract_description(doc),
            image_url: proxify_icon(extract_image_url(doc)),
            defunct_at: nil,
            screenshot_urls: proxify_screenshots(extract_screenshots(doc))
          }
        end

        def extract_name(doc)
          extract_value(doc, "[itemprop=name]") do |node|
            node.text.strip
          end
        end

        def extract_price(doc)
          extract_value(doc, "[itemprop=offers] [itemprop=price]") do |node|
            price = node[:content]
            price == "0" ? "Free" : price
          end
        end

        def extract_owner(doc)
          extract_value(doc, "[itemprop=author] [itemprop=name]") do |node|
            node.text.strip
          end
        end

        def extract_description(doc)
          extract_value(doc, "[itemprop=description]") do |node|
            GooglePlayHtmlDescriptionParser.parse(node)
          end
        end

        def extract_image_url(doc)
          extract_value(doc, "[itemprop=image]") do |node|
            node[:src].sub(%r{\A//}, "https://")
          end
        end

        def extract_screenshots(doc)
          extract_nodes(doc, "[itemprop=screenshot]").map do |img|
            img[:src].sub(%r{\A//}, "https://").tap do |screenshot_url|
              raise ParseError if screenshot_url.blank?
            end
          end
        end

        def extract_value(doc, selector)
          node = extract_node(doc, selector)
          value = yield(node)
          raise ParseError if value.blank?
          value
        end

        def extract_node(doc, selector)
          doc.at(scoped_selector(selector)).tap do |node|
            raise ParseError if node.nil?
          end
        end

        def extract_nodes(doc, selector)
          doc.search(scoped_selector(selector)).tap do |nodes|
            raise ParseError if nodes.empty?
          end
        end

        def scoped_selector(selector)
          "[itemtype='http://schema.org/MobileApplication'] #{selector}"
        end

        def proxify_icon(url)
          Appo::Constants::CDN_URL + "a/200/" + url
        end

        def proxify_screenshots(urls)
          urls.map do |url|
            Appo::Constants::CDN_URL + "s/1024/" + url
          end
        end
      end

      class ParseError < StandardError ; end
    end
  end
end

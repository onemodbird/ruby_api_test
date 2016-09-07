module Appo
  module Fetchers
    class Webpage
      include AssetHelper

      def initialize(url, prefetch: nil)
        @url = url
        @response = prefetch
      end

      def resource_data
        {
          name: name,
          description: description,
          image_url: image_url,
          price: "Free"
        }
      end

      def update_attributes
        {
          description: description,
          image_url: image_url,
          defunct_at: (defunct? ? Time.zone.now : nil)
        }
      end

      def defunct?
        !(response.code == 200)
      end

      def description
        sanitize(og_value(:description))
      end

      def name
        if og_title = og_value(:title)
          sanitize(og_title)
        elsif title = doc.at("title")
          sanitize(title.text.strip)
        elsif can_extract_filename_from_url?
          ::URI.decode(url_filename)
        else
          @url
        end
      end

      def image_url
        @image_url ||= extracted_image || fallback_image
      end

      def doc
        @doc ||= Nokogiri::HTML(html)
      end

      def html
        @html ||= response.body
      end

      def response
        @response ||= EasyFetcher.get(@url)
      end

      private

      def sanitize(string)
        unless string.nil?
          string = string.encode("UTF-8", "binary", invalid: :replace,
            undef: :replace, replace: "")

          ActionView::Base.full_sanitizer.sanitize string
        else
          nil
        end
      end

      def valid_url?(input)
        begin
          uri = ::URI.parse input
          uri.kind_of? ::URI::HTTP
        rescue ::URI::InvalidURIError
          false
        end
      end

      def og_value(key)
        if node = doc.at("meta[property=\"og:#{key}\"][content]")
          content = node["content"].strip
          return content if content.present?
        end

        nil
      end

      def extracted_image
        {
          "meta[property='og:image']" => -> (es) { es.first["content"] },
          "meta[name='twitter:image']" => -> (es) { es.first["content"] },
          "link[rel='apple-touch-icon']" =>
            -> (es) {
              es.sort_by{|e| e["sizes"].to_s.split("x").first.to_i }.last["href"]
            },
          "link[rel='apple-touch-icon-precomposed']" =>
            -> (es) {
              es.sort_by{|e| e["sizes"].to_s.split("x").first.to_i }.last["href"]
            }
        }
        .each do |selector, callable|
          elements = doc.css(selector)

          if elements.present?
            begin
              if value = callable[elements].strip
                value = ::URI.join(@url, value).to_s if value.starts_with?("/")
                return value if valid_url?(value)
              end
            rescue
              # Do nothing
            end
          end
        end

        nil
      end

      def fallback_image
        icon_no = @url.sum % 6 + 1
        cdn_url_for("chrome/icons/web" + icon_no.to_s.rjust(2, "0") + ".png")
      end

      def can_extract_filename_from_url?
        %w(.doc .docx .xls .xlsx .ppt .pptx .pdf)
          .include?(url_filename_extension)
      end

      def url_filename_extension
        @url_filename_extension ||= ::File.extname(url_filename)
      end

      def url_filename
        @url_filename ||= ::File.basename(url_path)
      end

      def url_path
        @url_path ||= ::URI.parse(@url).path
      end

    end
  end
end


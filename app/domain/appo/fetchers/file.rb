module Appo
  module Fetchers
    class File
      include AssetHelper

      def initialize(url)
        @url = url
      end

      def resource_data
        {
          name: name,
          price: "Free",
          image_url: image_url
        }
      end

      def update_attributes
        {}
      end

      def name
        ::File.basename(@url)
      end

      def image_url
        @image_url ||= extracted_image || fallback_image
      end

      def extracted_image
        nil
      end

      def fallback_image
        icon_no = @url.sum % 6 + 1
        category = case @url.match(/\.\w+$/).to_s
        when ".doc", ".docx", ".txt", ".html", ".rtf", ".pages"
          "doc"
        when ".aiff", ".aif", ".mp3", ".wav", ".au"
          "audio"
        when ".pdf"
          "pdf"
        when ".ppt", ".pptx", ".key"
          "pres"
        else
          "file"
        end

        cdn_url_for("chrome/icons/#{category}" + icon_no.to_s.rjust(2, "0") + ".png")
      end

    end
  end
end

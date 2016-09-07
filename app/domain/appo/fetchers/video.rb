module Appo
  module Fetchers
    class Video
      attr_accessor :video_id

      def initialize(url)
        uri = Addressable::URI.parse(url)
        if url =~ /vimeo/
          @video_id = uri.path.split('/').last
        else
          @video_id = uri.query_values.fetch('v')
        end
      end

      def resource_data
        {
          'name' => title,
          'owner' => owner,
          'price' => 'Free',
          'image_url' => screenshots.first,
          'imported_data' => {
            'new_via_admin' => data
          }
        }
      end

      def update_attributes
        if data.empty?
          {
            'defunct_at' => Time.zone.now
          }
        else
          {
            'name' => title,
            'owner' => owner,
            'defunct_at' => (can_be_embedded? ? nil : Time.zone.now)
          }
        end
      end

      def data
        case source
        when 'youtube' then youtube_data
        when 'vimeo' then vimeo_data
        else nil
        end
      end

      def screenshots
        case source
        when 'youtube' then youtube_screenshots
        when 'vimeo' then vimeo_screenshots
        else []
        end
      end

      def title
        case source
        when 'youtube' then youtube_title
        when 'vimeo' then vimeo_title
        else nil
        end
      end

      def owner
        case source
        when 'youtube' then youtube_owner
        when 'vimeo' then vimeo_owner
        else nil
        end
      end

      def can_be_embedded?
        case source
        when 'youtube' then youtube_can_be_embedded?
        when 'vimeo' then vimeo_can_be_embedded?
        else false
        end
      end

      def embed_url
        case source
        when 'youtube' then "https://www.youtube.com/embed/#{video_id}"
        when 'vimeo' then "https://player.vimeo.com/video/#{video_id}"
        else nil
        end
      end

      def web_url
        case source
        when 'youtube' then "https://www.youtube.com/watch?v=#{video_id}"
        when 'vimeo' then "http://vimeo.com/#{video_id}"
        else nil
        end
      end

      def source
        case
        when none? then 'none'
        when vimeo? then 'vimeo'
        when youtube? then 'youtube'
        else raise 'Invalid AppReview::Video source'
        end
      end

      def none?
        video_id.blank?
      end

      def vimeo?
        (video_id.to_s =~ /\A[0-9]+\z/) ? true : false
      end

      def youtube?
        !none? && !vimeo?
      end

      def youtube_screenshots
        thumbnails = youtube_data.fetch('snippet').fetch('thumbnails')
        image = thumbnails.fetch('standard', thumbnails.fetch('high'))
        [image.fetch('url')]
      rescue
        []
      end

      def youtube_title
        youtube_data.fetch('snippet').fetch('title')
      end

      def youtube_owner
        youtube_data.fetch('snippet').fetch('channelTitle')
      end

      def youtube_can_be_embedded?
        true == youtube_data.fetch('status', {}).fetch('embeddable', false)
      end

      def youtube_data
        @youtube_data ||=
          begin
            JSON.parse(
              Typhoeus.get(
                "https://www.googleapis.com/youtube/v3/videos" <<
                "?key=AIzaSyAnImHvqicK8qpHGZ26GFZR3ZErN2KZ4U0" <<
                "&part=snippet,status" <<
                "&id=#{video_id}"
              ).body
            ).fetch('items').first || {}
          rescue
            {}
          end
      end

      def vimeo_screenshots
        image = vimeo_data.fetch('thumbnail_large')
        [image]
      rescue
        []
      end

      def vimeo_title
        vimeo_data.fetch('title')
      end

      def vimeo_owner
        vimeo_data.fetch('user_name')
      end

      def vimeo_can_be_embedded?
        'anywhere' == vimeo_data.fetch('embed_privacy')
      end

      def vimeo_data
        @vimeo_data ||=
          begin
            JSON.parse(
              Typhoeus.get(
                "http://vimeo.com/api/v2/video/#{video_id}.json"
              ).body
            ).first
          rescue
            {}
          end
      end
    end
  end
end

module Appo
  class ResourceFactory

    attr_accessor :resource

    def initialize(url, attributes: {}, prefetch: nil)
      @url = resolve_url(url)
      @prefetch = prefetch

      unless @resource = Resource.find_by(url: @url)
        @resource = Resource.new(attributes.compact.merge(url: @url))

        if @resource.kind.nil?
          @resource.kind = ResourceKind.kind(@url)
        end

        queue_for_update
      end
    end

    def self.from_file(file, user_id)
      uploaded_file = UploadedFile.create(file: file, user_id: user_id)
      new(uploaded_file.url)
    end

    def queue_for_update
      update_period = @resource.kind == "webpage" ? 1.week : 1.day
      resource.update_queued_at = Time.at(
          Time.now.to_i - rand(update_period)
        ) + 12.hours
    end

    def resource_exists?
      @resource.new_record? ? false : true
    end

    def resource_with_data_fetch
      if @resource.new_record?
        @resource.attributes = get_fetcher.resource_data
      end

      @resource
    end

    private

    def resolve_url(url)
      uri = Addressable::URI.parse(url)

      if uri.host == "appsto.re"
        response = Typhoeus.get(url)
        raise "Unhandled response code" unless response.code == 301
        url = response.headers.fetch("location")
      end

      Appo::URI.clean(url)
    end

    def get_fetcher
      case @resource.kind
      when "app"
        Appo::Fetchers::App.new(@url)
      when "video"
        Appo::Fetchers::Video.new(@url)
      when "webpage"
        Appo::Fetchers::Webpage.new(@url, prefetch: @prefetch)
      when "file"
        Appo::Fetchers::File.new(@url)
      when "ibook"
        Appo::Fetchers::Ibook.new(@url)
      else
        raise "Invalid kind (#{@resource.kind}) for resource"
      end
    end

    class InvalidHashValue < StandardError; end
  end
end

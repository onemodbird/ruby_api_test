module Appo
  class ResourceKind
    def self.os(url)
      case url
      when /itunes\.apple\.com/ then 'ios'
      when /play\.google\.com/ then 'android'
      else raise "Unhandled or invalid app url"
      end
    end

    def self.kind(url)
      uri = Addressable::URI.parse(url)
      case uri.host
      when 'itunes.apple.com'
        if ios_app?(uri)
          'app'
        elsif ibook?(uri)
          'ibook'
        else
          'webpage'
        end
      when 'play.google.com'
        uri.path =~ %r{\A/store/apps/} ? 'app' : 'webpage'
      when 'www.youtube.com'
        uri.path =~ %r{\A/watch} ? 'video' : 'webpage'
      when 'vimeo.com'
        uri.path =~ %r{\A/\d+\z} ? 'video' : 'webpage'
      when 's3.amazonaws.com'
        uri.path =~ %r{\A/com\.appolearning\.files/} ? 'file' : 'webpage'
      else
        'webpage'
      end
    end

    def self.app_store_id(url)
      case os(url)
      when 'ios'
        url[/\/id(\d+)/, 1]
      when 'android'
        CGI.parse(Addressable::URI.parse(url).query)['id'].first
      else
        raise 'Unable to find app store id'
      end
    end

    def self.ios_app?(uri)
      uri.path =~ %r{\A/app/} || uri.query_values.to_h["mt"] == "8"
    end

    def self.ibook?(uri)
      media_type_id = uri.query_values.to_h["mt"]
      uri.path =~ %r{\A/book/} || %w(11 13).include?(media_type_id)
    end
  end
end

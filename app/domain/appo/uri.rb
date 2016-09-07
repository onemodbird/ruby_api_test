module Appo
  module URI
    extend PostRank::URI

    module_function

    def clean url
      if url =~ %r{\Ahttp://splash.abc.net.au/home#!/}
        url = clean_preserving_fragment(url)
      else
        url = PostRank::URI.clean(url)
      end

      if url =~ %r{\Ahttps?://itunes\.apple\.com/}
        uri = Addressable::URI.parse(url)
        uri.scheme = 'https'
        if uri.query_values.to_h["mt"] == "8" # an iOS app
          uri.query = nil
          uri.path = '/app/' + uri.path.split('/').last
        elsif ibook?(uri)
          uri.query = nil
          uri.path = "/book/" + uri.path.split("/").last
        elsif uri.query_values
          uri.query_values = uri.query_values.select{|k,v| k == "mt"}
        end
        url = uri.to_s
      elsif url =~ %r{\Ahttps?://play\.google\.com/}
        uri = Addressable::URI.parse(url)
        uri.scheme = 'https'
        uri.query_values = uri.query_values.select{|k,v| k == 'id'}
        url = uri.to_s
      elsif url =~ %r{\Ahttps?://youtu\.be/}
        uri = Addressable::URI.parse(url)
        uri.scheme = 'https'
        uri.host = 'www.youtube.com'
        uri.query_values = { 'v' => uri.path.split('/').reject(&:empty?).first }
        uri.path = '/watch'
        url = uri.to_s
      end

      url
    end

    def ibook?(uri)
      %w(11 13).include?(uri.query_values.to_h["mt"]) ||
        uri.path =~ %r{\A/(?:[a-z]{2}/)?/book/}
    end

    def clean_preserving_fragment uri, opts={}
      normalize_preserving_fragment(c14n(unescape(uri), opts)).to_s
    end

    def normalize_preserving_fragment uri, opts={}
      u = parse(uri, opts)
      u.path = u.path.squeeze('/')
      u.path = u.path.chomp('/') if u.path.size != 1
      u.query = nil if u.query && u.query.empty?
      u
    end

  end
end

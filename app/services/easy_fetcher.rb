class EasyFetcher
  private_class_method :new

  def self.get(url)
    cookies = Tempfile.new("cookies")
    cookies.close

    request = Typhoeus::Request.new(
      url,
      followlocation: true,
      timeout: 30,
      accept_encoding: "gzip",
      cookiefile: cookies.path,
      cookiejar: cookies.path,
      headers: request_headers(url))

    request.on_headers do |response|
      @abort = !!( response.headers["Content-Type"] =~ %r{\A(audio|video)/} )
    end

    request.on_body do |chunk, response|
      @abort ? :abort : response.body << chunk
    end

    response = request.run

    new(request, response)
  ensure
    cookies.unlink
  end

  def self.request_headers(url)
<<<<<<< HEAD
    if Addressable::URI.parse(url).domain == "greenprintmedia.org"
      { "User-Agent" => "greenprintLearning/1.0" }
=======
    if Addressable::URI.parse(url).domain == "participate.com"
      { "User-Agent" => "ParticipateLearning/1.0" }
>>>>>>> parent of 0bd3464... customize to greenprintmedia
    else
      {}
    end
  end

  attr_reader :request, :response

  def initialize(request, response)
    @request = request
    @response = response
  end

  def body
    @response.body
  end

  def code
    @response.code
  end

  def return_code
    @response.return_code
  end

  def timed_out?
    @response.timed_out?
  end

  def effective_url
    @response.effective_url
  end

  def redirect_count
    @response.redirect_count
  end

  def redirect_urls
    @response
      .options[:response_headers]
      .to_s
      .split("\r\n")
      .select{|line| line =~ /\ALocation: /}
      .map{|line| line[/\ALocation: (.*)/, 1] }
  end

  def headers
    @response.headers
  end

end

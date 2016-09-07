module GnipService
  class History
    URL = %w(
      https://search.gnip.com
<<<<<<< HEAD
        /accounts/greenprintLearning
=======
        /accounts/ParticipateLearning
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        /search/prod.json
    ).join

    def initialize(config)
      @config = config
    end

    def get(hashtag, cursor = nil)
      JSON.parse(
        Typhoeus.get(URL, options(hashtag, cursor)).body)
    end

    private
    attr_reader :config

    def options(hashtag, cursor)
      {
        userpwd: config.credentials,
        accept_encoding: "gzip",
        params: params(hashtag, cursor)
      }
    end

    def params(hashtag, cursor)
      params = {
        publisher: "twitter",
        query: hashtag,
        maxResults: 500,
      }

      params[:next] = cursor if cursor
      params
    end
  end
end

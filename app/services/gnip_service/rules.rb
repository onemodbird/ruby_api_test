module GnipService
  class Rules
    URL = %w(
      https://gnip-api.twitter.com
        /rules/powertrack
<<<<<<< HEAD
        /accounts/greenprintLearning
=======
        /accounts/ParticipateLearning
>>>>>>> parent of 0bd3464... customize to greenprintmedia
        /publishers/twitter
        /prod.json
    ).join

    def initialize(config)
      @config = config
    end

    def get
      response = Typhoeus.get(URL, userpwd: config.credentials)
      JSON.parse(response.body)
        .fetch("rules")
        .map { |rule| rule.fetch("value") }
    rescue KeyError => e
      Rails.logger.info "[GnipService::Rules][#{Process.pid}][#{Thread.current}] error: #{e.message}"
      Rails.logger.info "[GnipService::Rules][#{Process.pid}][#{Thread.current}] code: #{response.code}"
      Rails.logger.info "[GnipService::Rules][#{Process.pid}][#{Thread.current}] body: #{response.body}"
      Rails.logger.info "[GnipService::Rules][#{Process.pid}][#{Thread.current}] caller: #{caller.inspect}"
      raise
    end

    def add(rules)
      return true if rules.empty?
      post(rules).success?
    end

    def remove(rules)
      return true if rules.empty?
      post(rules, params: { _method: "delete" }).success?
    end

    private
    attr_reader :config

    def post(rules, options = {})
      defaults = {
        userpwd: config.credentials,
        headers: { "Content-Type": "application/json" },
        body: format_rules(rules)
      }

      Typhoeus.post(URL, defaults.merge(options))
    end

    def format_rules(rules)
      { rules: rules.map { |rule| { value: rule } } }.to_json
    end
  end
end

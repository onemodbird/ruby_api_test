module GnipService
  class Config
    attr_reader :username, :password

    def initialize(username: Secrets.gnip.username,
                   password: Secrets.gnip.password)

      @username = username
      @password = password
    end

    def credentials
      "#{@username}:#{@password}"
    end
  end
end

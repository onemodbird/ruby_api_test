module Authentication
  class Facebook
    def self.authenticate(token)
      fields = %w{id email name picture.type(large)}
      url = "https://graph.facebook.com/me?access_token=#{token}&fields=#{fields.join(',')}"

      RestClient.get(url) do |resp|
        parse_response JSON.parse(resp)
      end
    end

    private

    def self.parse_response(resp)
      raise "Internal facebook error #{resp["error"]}" if resp["error"]

      AuthResponse.new(
        name: resp["name"],
        email: resp["email"],
        provider: :facebook,
        provider_id: resp["id"],
        profile_photo_url: resp["picture"]["data"].fetch("url")
      )
    end
  end
end

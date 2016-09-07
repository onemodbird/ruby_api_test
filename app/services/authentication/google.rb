module Authentication
  class Google
    def self.authenticate(token)
      url = "https://www.googleapis.com/plus/v1/people/me"

      RestClient.get(url, Authorization: "Bearer #{token}") do |resp|
        parse_response JSON.parse(resp)
      end
    end

    private

    def self.parse_response(resp)
      profile_photo_url = resp.fetch("image").fetch("url")
      profile_photo_url.gsub!(/\?sz=\d+\z/, "?sz=200")

      AuthResponse.new(
        name: resp.fetch("displayName"),
        email: resp.fetch("emails").try(:first).try(:fetch, "value"),
        provider: :google,
        provider_id: resp["id"],
        profile_photo_url: profile_photo_url
      )
    end
  end
end

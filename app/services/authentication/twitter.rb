module Authentication
  class Twitter
    def self.authenticate(token)
      parse_response TwitterService.client(token).verify_credentials(
        skip_status: true,
        include_email: true)
    end

    private

    def self.parse_response(resp)
      AuthResponse.new(
        name: resp.attrs[:name],
        email: resp.attrs[:email],
        provider: :twitter,
        provider_id: resp.attrs[:id].to_s,
        twitter_username: resp.attrs[:screen_name],
        profile_photo_url: TwitterService.profile_img(resp.attrs[:screen_name], :original)
      )
    end
  end
end

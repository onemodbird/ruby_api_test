module Authentication
  class Email
    def self.authenticate(token)
      email, password = parse_token(token)

      user = User.find_for_authentication(email: email)

      if user && user.valid_password?(password)
        parse_response(user)
      else
        nil
      end
    end

    def self.parse_token(token)
      token.split(":")
    end

    private

    def self.parse_response(user)
      AuthResponse.new(
        name: user.name,
        email: user.email,
        provider: :email,
        provider_id: user.email,
        profile_photo_url: user.profile_photo_url
      )
    end
  end
end

class Session
  attr_reader :user, :error

  def initialize(auth_token)
    @user = User.for_auth_token(auth_token)
    @error = "Your session is no longer valid. Please sign in again." unless @user
  end

  def self.token
    SecureRandom.urlsafe_base64
  end

  def valid?
    @user.present? && !@error.present?
  end
end

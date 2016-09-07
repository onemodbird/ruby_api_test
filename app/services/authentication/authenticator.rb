module Authentication
  class Authenticator
    PROVIDERS = [:email, :facebook, :google, :twitter]

    def self.login(provider, token)
      response = authenticate(provider, token)

      if response && user = User.find_by(response.provider_attribute => response.provider_id)
        perform_user_maintenance(user, response)
        Session.new(user.auth_token)
      else
        case provider.to_sym
        when :email
          raise Authentication::AuthError, "Invalid email or password. Please try again."
        else
          raise Authentication::AuthErrorTryRegistration, "That #{provider} account is not yet registered."
        end
      end
    end

    def self.register(provider, token, params = {})
      if provider.to_sym == :email
        register_via_email(token, params)
      else
        register_via_provider(provider, token, params)
      end
    end

    private

    def self.perform_user_maintenance(user, response)
      user.update_auth_token!

      # Set email if not yet captured
      if user.email.blank? && response.email.present?
        user.update_attribute(:email, response.email) unless User.exists?(email: response.email)
      end
    end

    def self.register_via_email(token, params = {})
      email, password = Email.parse_token(token)
      user = User.create({ email: email.try(:downcase), password: password }.merge(params))

      raise(Authentication::AuthError, user.errors.full_messages.join(", ")) unless user.valid?

      user
    end

    def self.register_via_provider(provider, token, params = {})
      response = authenticate(provider, token)

      # User attempted a registration, but is already registered
      if response.provider_id && user = User.find_by(response.provider_attribute => response.provider_id)
        return user
      end

      # User has an existing account
      user ||= User.find_by(email: response.email) if response.email.present?

      # User has active session
      user ||= User.for_auth_token(params.delete(:auth_token)) if params[:auth_token].present?

      if user
        user.update_attributes(response.user_attributes.except(:name, :email))
      else
        user = User.create(response.user_attributes)
      end

      user
    end

    def self.connect_provider(user, provider, token)
      response = authenticate(provider, token)

      # This provider is already registered for another user
      if User.where(response.provider_attribute => response.provider_id)
        .where.not(id: user.id).exists?
          raise Authentication::AuthError, "That #{provider} account is already registered."
      end

      exclude = [:name]
      exclude << :email unless user.email.nil?

      user.update_attributes(response.user_attributes.except(*exclude))

      user
    end

    def self.authenticate(provider, token)
      if instance = get_provider(provider)
        begin
          return instance.authenticate(token)
        rescue => e
          ErrorNotification.notify(e, error_message: "Authentication: #{provider} failure")
        end
      end

      raise "Authentication failed."
    end

    def self.get_provider(provider)
      clazz = provider.downcase.to_sym

      if PROVIDERS.include?(clazz)
        "Authentication::#{clazz.to_s.capitalize}".constantize
      end
    end
  end
end

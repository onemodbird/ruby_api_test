module Authentication
  class AuthResponse
    attr_accessor :provider, :name, :email, :provider_id,
      :provider_username, :profile_photo_url

    def initialize(params = {})
      @provider = params[:provider]
      @name = params[:name]
      @email = params[:email]
      @provider_id = params[:provider_id]
      @provider_username = params[:provider_username]
      @profile_photo_url = params[:profile_photo_url]
    end

    def user_attributes
      attrs = {
        name: name,
        email: email,
        profile_photo_url: profile_photo_url
      }

      attrs[provider_attribute] = provider_id

      if User.attribute_names.include?("#{provider}_username")
        attrs["#{provider}_username"] = provider_username
      end

      attrs
    end

    def provider_attribute
      provider == :email ? "email" : "#{provider}_id"
    end
  end
end

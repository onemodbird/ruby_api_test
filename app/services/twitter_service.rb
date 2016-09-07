class TwitterService
  SIZES = [:mini, :normal, :bigger, :original]

  # Nil token for app authentication, token for user authentication
  def self.client(token = nil)
    config = app_configuration

    if token.present?
      config[:access_token], config[:access_token_secret] = token.split(/[:@]/)
    end

    ::Twitter::REST::Client.new do |c|
      c.consumer_key        = config["consumer_key"]
      c.consumer_secret     = config["consumer_secret"]
      c.access_token        = config["access_token"]
      c.access_token_secret = config["access_token_secret"]
    end
  end

  def self.app_configuration
    local_config = Bundler.root.join("config/twitter.local.yml")

    if File.exists?(local_config)
      YAML.load_file(local_config)["twitter"] || Secrets.twitter.dup
    else
      Secrets.twitter.dup
    end
  end

  # Redirect url from twitter to profile image.
  # Size choices:
  # :mini - 24px x 24px
  # :normal - 48px x 48px
  # :bigger - 73px x 73px
  # :original - likely too damn big
  def self.profile_img(twitter_handle, size = :bigger)
    return nil if twitter_handle.nil?
    raise "Size must be one of #{SIZES.join(',')}" unless SIZES.include?(size.to_sym)
    "https://twitter.com/#{twitter_handle.downcase}/profile_image?size=#{size}"
  end

  def self.tweet_length(text)
    Twitter::Validation.tweet_length(text)
  end

  def self.length_valid?(text)
    tweet_length(text) <= 140
  end

  def self.user_hash(screen_names_or_ids)
    user_lookup(screen_names_or_ids).inject({}) do |hash, user|
      hash[user["screen_name"]] = user.except("screen_name")
      hash
    end
  end

  def self.user_lookup(screen_names_or_ids)
    lookups = normalize_lookups(screen_names_or_ids)

    (client.users(lookups) || []).map do |user|
      { "id" => user.id.to_s,
        "screen_name" => user.screen_name,
        "twitter_profile_image_url" => profile_img(user.screen_name) }
    end
  end

  def self.rate_limit_status
    request =
      Twitter::REST::Request.new(
        client, :get, '/1.1/application/rate_limit_status.json')

    request.perform
  end

  def self.normalize_lookups(lookups)
    return [] if lookups.blank?

    lookups.split(",").flatten.map do |val|
      val.is_a?(String) ? val.gsub(/@|\s/, "") : val
    end
  end
end

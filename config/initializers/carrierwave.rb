CarrierWave.configure do |config|
  if Rails.env.test?
    config.storage = :file
    config.enable_processing = false
  else
    config.storage    = :aws
    config.aws_bucket = "com.appolearning.files"
    config.aws_acl    = "public-read"
    config.asset_host = "https://s3.amazonaws.com/com.appolearning.files"
    config.aws_authenticated_url_expiration = 600

    config.aws_credentials = {
      access_key_id:     Secrets.aws.access_key_id,
      secret_access_key: Secrets.aws.secret_access_key,
      region: "us-east-1"
    }
  end

end

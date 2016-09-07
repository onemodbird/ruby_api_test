require "airbrake"

Airbrake.configure do |config|
  config.api_key = "#{Secrets.airbrake.project_key}"
  config.params_filters << :provider_token
end


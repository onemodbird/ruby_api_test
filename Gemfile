source "https://rubygems.org"

ruby "2.3.1"

source "https://rails-assets.org" do
  gem "rails-assets-bootstrap-sass-official"
  gem "rails-assets-bootstrap-tags", path: "vendor/gems/rails-assets-bootstrap-tags-1.1.6"
  gem "rails-assets-jquery-ui"
  gem "rails-assets-showdown"
end

gem "rails", "4.2.6" # Bundle edge Rails instead: gem "rails", github: "rails/rails"
gem "pg" # Use postgresql as the database for Active Record
gem "redis-rails"
gem "hiredis"
gem "sass-rails", "~> 5.0" # Use SCSS for stylesheets
gem "uglifier", ">= 1.3.0" # Use Uglifier as compressor for JavaScript assets
gem "coffee-rails", "~> 4.1.0" # Use CoffeeScript for .coffee assets and views
gem "haml-rails"
gem "jquery-rails" # Use jquery as the JavaScript library
gem "jbuilder", "~> 2.0" # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem "sdoc", "~> 0.4.0", group: :doc # bundle exec rake doc:rails generates the API under doc/api.

gem "eye"
gem "sidekiq"
gem "sidekiq-cron"
gem "typhoeus", require: "typhoeus/adapters/faraday"
gem "devise"
gem "devise-async"
gem "simple_form"
gem "postrank-uri"
gem "kaminari"
gem "bootstrap-kaminari-views"
gem "rest-client"
gem "elasticsearch-rails", require: ["elasticsearch/rails/instrumentation"]
gem "elasticsearch-model"
gem "unicorn"
gem "airbrake", "4.3.5" # This is intentionally not using the 5 series, we had issues with Sidekiq failures with 5.0.4
gem "mailgun_rails"
gem "analytics-ruby"
gem "cancancan"
gem "redcarpet"
gem "whenever", require: false
gem "rack-cors"
gem "validates_existence"
gem "carrierwave"
gem "carrierwave-aws"
gem "twitter", "5.14.0" # Locked. HTTP Gem update breaks streaming, waiting for 6.0 release. https://github.com/sferik/twitter/pull/631
gem "twitter-text"
gem "sinatra"
gem "grape", "0.12.0" # Locked because of an issue with format :json, should be reverted in 0.14.0
gem "grape-cancan"
gem "grape-swagger-rails"
gem "grape-swagger"
gem "grape-active_model_serializers"
gem "hashie-forbidden_attributes" # Fixes grape/hashie active record creation issue
gem "premailer-rails"
gem "mini_magick"
gem "pusher"
gem "ice_cube"
gem "recurring_select"
gem "skylight"
gem "oauth"
<<<<<<< HEAD
gem "mysql2" # For greenprintmedia.org data import
=======
gem "mysql2" # For viflearn.com data import
>>>>>>> parent of 0bd3464... customize to greenprintmedia
gem "sanitize"

# Gnip streaming requirements
gem "eventmachine"
gem "em-http-request"
gem "yajl-ruby"
gem "em-twitter"

group :development do
  # Forcing 3.1.0 b/c 3.2.1 appears broken & does not deploy
  # - It does not actually create the release directory
  gem "capistrano"
  gem "capistrano-rails"

  gem "guard"
  gem "guard-rspec"
  gem "benchmark-ips"
  gem "quiet_assets"
  gem "spring-commands-rspec"
  gem "web-console", "~> 3.0"
end

group :development, :test do
  gem "pry-rails"
  gem "pry-byebug"
  gem "spring"
  gem "faker"
  gem "factory_girl_rails"
  gem "rspec"
  gem "rspec-rails"
  gem "test_after_commit"
end

group :test do
  gem "timecop"
  gem "database_cleaner"
  gem "webmock"
end

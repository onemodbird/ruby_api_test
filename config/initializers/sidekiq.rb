# Perform Sidekiq jobs immediately in development,
# so you don't have to run a separate process.
# You'll also benefit from code reloading.
require "sidekiq"

if Rails.env.test?
  require 'sidekiq/testing'
  Sidekiq::Testing.inline!

  # Don't exectue future jobs in test/dev
  module Sidekiq::Worker::ClassMethods
    def perform_at(*args)
      "abcdefg#{rand(5000000)}" # Fake job id
    end

    def perform_in(*args)
      "abcdefg#{rand(5000000)}" # Fake job id
    end
  end
else
  Sidekiq.configure_server do |config|
    config.redis = {
      url: Secrets.redis.url,
      namespace: Secrets.redis.namespace,
      driver: "hiredis"
    }
  end

  Sidekiq.configure_client do |config|
    config.redis = {
      url: Secrets.redis.url,
      namespace: Secrets.redis.namespace,
      driver: "hiredis"
    }
  end
end

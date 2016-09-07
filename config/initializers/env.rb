# Fake rails environment for non-rails usage
require "active_support"

unless Kernel.const_defined?("Rails")
  module Rails
    def self.env
      @_env ||= ActiveSupport::StringInquirer.new(ENV["RAILS_ENV"] || ENV["RACK_ENV"] || "development")
    end
  end
end

unless Kernel.const_defined?("Secrets")
  require_relative "env"
  require "yaml"
  require "hashie"
  require "active_support"
  require "erb"
  require_relative "../../app/domain/appo"

  path = File.expand_path("../../secrets.yml", __FILE__)
  erb = ERB.new(File.read(path))
  yaml = YAML.load(erb.result)
  Secrets = Hashie::Mash.new(yaml)[Rails.env]
  Appo.deep_freeze(Secrets)
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails-assets-bootstrap-tags/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-assets-bootstrap-tags"
  spec.version       = RailsAssetsBootstrapTags::VERSION
  spec.authors       = ["rails-assets.org"]
  spec.description   = "Bootstrap-themed jquery tag interface"
  spec.summary       = "Bootstrap-themed jquery tag interface"
  spec.homepage      = "http://github.com/maxwells/bootstrap-tags"
  spec.license       = "MIT"

  spec.files         = `find ./* -type f | cut -b 3-`.split($/)
  spec.require_paths = ["lib"]

  spec.add_dependency "rails-assets-bootstrap", ">= 2.3.2"
  spec.add_dependency "rails-assets-jquery", ">= 1.9.0"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

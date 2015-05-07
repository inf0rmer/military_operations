# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'military_operations/version'

Gem::Specification.new do |spec|
  spec.name          = "military_operations"
  spec.version       = MilitaryOperations::VERSION
  spec.authors       = ["Bruno Abrantes"]
  spec.email         = ["bruno@brunoabrantes.com"]
  spec.summary       = "Gives you a random military operation name"
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = ["military_operations"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "pry"

  spec.add_dependency "nokogiri", "~> 1.6"
  spec.add_dependency "blanket_wrapper", "~> 3.0"
end

# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec_http_test/version'

Gem::Specification.new do |spec|
  spec.name          = "rspec_http_test"
  spec.version       = RspecHttpTest::VERSION
  spec.authors       = ["Gary Taylor"]
  spec.email         = ["gary.taylor@hismessages.com"]
  spec.description   = %q{Provides easy to use helpers for testing HTTP endpoints (REST or not, any format)}
  spec.summary       = %q{Provides easy to use helpers for testing HTTP endpoints (REST or not, any format)}
  spec.homepage      = "https://github.com/garytaylor/rspec_http_test"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]
  spec.add_runtime_dependency "rest-client"
  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
end

require "rspec_http_test/version"
require 'rspec'
require 'rest-client'
require 'rspec_http_test/http_helpers'

RSpec.configure do |c|
  c.include(RspecHttpTest::HTTPHelpers)
end


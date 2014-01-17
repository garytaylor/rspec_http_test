require 'active_support/core_ext/hash'

class RspecHttpTest
  def self.config=(config)
    @config = config
  end

  def self.config
    @config ||= {}
  end

  module HTTPHelpers
    def response
      @last_response  
    end
    def request(*args)
      defaults = RspecHttpTest.config[:defaults] || {}
      opts_i = args[2].is_a?(String) ? 3 : 2
      args[opts_i] ||= {} if defaults
      args[opts_i].reverse_merge!(defaults)
      @last_response = RestClient.send(*args)
    rescue RestClient::Exception => e
      @last_response = e.response
      e.response
    end

    [:get, :put, :post, :delete, :head].each do |verb|
      self.send(:define_method, verb) do |*args|
        out = [verb, "#{RspecHttpTest.config[:base_url]}#{args[0]}"] +  args[1..-1]
        request(*out)
      end
    end
  end
end

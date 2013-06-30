require 'faraday'
require 'gamertag/version'

module Gamertag
  module Configuration
    OPTION_KEYS = [
        :endpoint_url,
        :api_version,
        :adapter
      ]

    DEFAULT_ENDPOINT_URL = 'https://www.xboxleaders.com'
    DEFAULT_API_VERSION = '2.0'
    DEFAULT_ADAPTER = Faraday.default_adapter

    attr_accessor(*OPTION_KEYS)

    def self.extended(base)
      base.defaults
    end

    def configure
      yield self
    end

    def defaults
      self.endpoint_url = DEFAULT_ENDPOINT_URL
      self.api_version = DEFAULT_API_VERSION
      self.adapter = DEFAULT_ADAPTER
    end

    def adapter=(adapter)
      @adapter = adapter
    end

    def endpoint_url=(endpoint_url)
      @endpoint_url = endpoint_url
    end

    def api_version=(api_version)
      @api_version = api_version
    end
  end
end
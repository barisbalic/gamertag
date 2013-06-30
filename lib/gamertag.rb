require 'gamertag/configuration'
require 'gamertag/error'
require 'gamertag/client'

module Gamertag
  extend Configuration

  class << self
    # Alias for Gamertag::Client.new
    #
    # @return [Gamertag::Client]
    def new
      Gamertag::Client.new
    end

    # Delegate calls to Gamertag::Client instance
    def method_missing(method, *args, &block)
      return super unless new.respond_to?(method)
      new.send(method, *args, &block)
    end
  end
end

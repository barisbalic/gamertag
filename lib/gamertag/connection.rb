require 'faraday_middleware'
require 'faraday/response/raise_xbox_leaders_error'
require 'faraday/response/cleanup_xbox_leaders_naming'

module Gamertag
  # @private
  module Connection
    def get(path, params={})
      conn = Faraday.new(:url => Gamertag.endpoint_url) do |faraday|
        faraday.use Faraday::Response::RaiseXboxLeadersError
        faraday.use Faraday::Response::Mashify
        faraday.use Faraday::Response::ParseJson
        faraday.use Faraday::Response::CleanupXboxLeadersNaming
        faraday.adapter  Faraday.default_adapter
      end
      
      response = conn.get "/api/#{Gamertag.api_version}#{path}", params
      response.body
    end
  end
end
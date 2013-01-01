require 'cgi'
module Gamertag
  class Friends
    def initialize(gamertag)
      @friends = fetch(gamertag)
    end

    def friends
      @friends['Friends']
    end

    def online_friends
      friends.select(&:IsOnline)
    end

    private

    def fetch(gamertag)
      uri = URI.parse("http://www.xboxleaders.com/api/friends.json?gamertag=#{CGI.escape gamertag}")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      Hashie::Mash.new hash['Data']
    end
  end
end

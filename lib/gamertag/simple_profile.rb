module Gamertag
  class SimpleProfile
    def initialize(gamertag)
      @profile = fetch(gamertag)
    end

    def method_missing(method_name, args = nil)
      @profile[method_name.to_s]
    end

    def recent_games
      @profile['recent_games'].map do |k, v|
        Hashie::Mash.new(v.merge({'last_played' => Time.at(v['last_played'].to_i)}))
      end
    end
    
    def avatars
      Hashie::Mash.new(@profile['avatars'])
    end

    private
    def fetch(gamertag)
      uri = URI.parse("http://api.xboxleaders.com/newapi.php?gamertag=#{gamertag}&version=2.0&format=json")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      hash['user']
    end
  end
end
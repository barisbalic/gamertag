module Gamertag
  class SimpleProfile
    # Retrieve XBOX profile information for a given XBOX gamertag from
    # xboxleaders.com
    #
    # @param gamertag [String] XBOX gamertag to retrieve profile information for.
    # @param seed_data [Hash, nil] Seed data to be used for profile information.
    def initialize(gamertag, seed_data = nil)
      if seed_data
        @profile = seed_data
      else
        @profile = fetch(gamertag)
      end
    end

    # Parse profile information from JSON data.
    #
    # @param data [String] JSON data containing XBOX profile information.
    #
    # @return Parsed profile information from JSON data.
    def self.from_json(data)
      data = JSON.parse(data)
      new(data["gamertag"], data)
    end

    # Dispatch method names like +gamertag+ or +gamerscore+ to the profile Hash.
    #
    # @param method_name [Symbol] Method name.
    # @param args [Array, nil] Method arguments.
    #
    # @return Information from the profile Hash or +nil+ if not found.
    def method_missing(method_name, args = nil)
      @profile[method_name.to_s]
    end

    # Retrieve the recent games from the profile.
    #
    # @return Recent games from the profile.
    def recent_games
      @profile['recent_games'].map do |k, v|
        Hashie::Mash.new(v.merge({'last_played' => Time.at(v['last_played'].to_i)}))
      end
    end

    # Retrieve the various avatars in use for a profile.
    #
    # @return The various avatars in use for a profile.
    def avatars
      Hashie::Mash.new(@profile['avatars'])
    end

    private

    # Retrieve the profile information as JSON from xboxleaders.com for a given
    # XBOX gamertag.
    #
    # @param gamertag [String] XBOX gamertag to retrieve profile information for.
    #
    # @return Hash of profile information from xboxleaders.com.
    def fetch(gamertag)      
      uri = URI.parse("http://api.xboxleaders.com/v2/?gamertag=#{gamertag}&format=json")
      response = Net::HTTP.get_response(uri)
      hash = JSON.parse(response.body)
      hash['user']
    end
  end
end

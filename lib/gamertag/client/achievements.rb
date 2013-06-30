module Gamertag
  class Client
    module Achievements
      # Retrieve the achievements for the user
      #
      # @see https://www.xboxleaders.com/examples/#achievements
      # @param gamertag [string] User's gamertag
      # @param game_id [Fixnum] The Game ID
      # @return [Array<Hashie::Mash>] A list of achievements for the specified game
      def achievements(gamertag, game_id)
        get('/achievements.json', :gamertag => gamertag, :gameid => game_id).data.achievements
      end
    end
  end
end
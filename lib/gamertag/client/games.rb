module Gamertag
  class Client
    module Games
      # Retrieve the games played by the user
      #
      # @see https://www.xboxleaders.com/examples/#games
      # @param gamertag [String] User's gamertag
      # @return [Array<Hashie::Mash>] List of the games played
      def games(gamertag)
        get('/games.json', :gamertag => gamertag).data.games
      end

      # Retrieve the potential gamerscore for the user
      #
      # @see https://www.xboxleaders.com/examples/#games
      # @param gamertag [String] User's gamertag
      # @return [Fixnum] The score the user has achieved
      def potential_gamerscore(gamertag)
        get('/games.json', :gamertag => gamertag).data.gamerscore.total
      end

      # Retrieve the number of achievements the user could achieve from the collection of games that they have played at some point 
      #
      # @see https://www.xboxleaders.com/examples/#games
      # @param gamertag [String] User's gamertag
      # @return [Fixnum] The potential achievement count for the user 
      def potential_achievement_count(gamertag)
        get('/games.json', :gamertag => gamertag).data.achievements.total
      end

      # Retrieve the number of achievements the user has actually achieved from the collection of games that they have played
      #
      # @see https://www.xboxleaders.com/examples/#games
      # @param gamertag [String] User's gamertag
      # @return [Fixnum] The actual achievement count for the user
      def achievement_count(gamertag)
        get('/games.json', :gamertag => gamertag).data.achievements.current
      end
    end
  end
end
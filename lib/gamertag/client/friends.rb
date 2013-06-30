module Gamertag
  class Client
    module Friends
      # Retrieve the friends of the user
      #
      # @see https://www.xboxleaders.com/examples/#friends
      # @param gamertag [String] User's gamertag
      # @return [Array<Hashie::Mash>] A list of friends
      def friends(gamertag)
        get('/friends.json', :gamertag => gamertag).data.friends
      end
    end
  end
end
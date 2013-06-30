module Gamertag
  class Client
    module Profile
      # Retrieve the profile for the user
      #
      # @see https://www.xboxleaders.com/examples/#profile
      # @param gamertag [string] User's gamertag
      # @return <Hashie::Mash> The user's profile
      def profile(gamertag)
        get('/profile.json', :gamertag => gamertag).data
      end
    end
  end
end
module Gamertag
  class Profile < SimpleProfile
    attr_reader :played_games
    
    # Create a new profile for an XBOX gamertag.
    #
    # @param gamertag [String] XBOX gamertag to retrieve +Gamertag::PlayedGames+ for.
    def initialize(gamertag)
      super(gamertag)
      @played_games = PlayedGames.new(gamertag)
    end
  end
end
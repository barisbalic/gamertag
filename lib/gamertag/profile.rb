module Gamertag
  class Profile < SimpleProfile
    attr_reader :played_games
    
    def initialize(gamertag)
      super(gamertag)
      @played_games = PlayedGames.new(gamertag)
    end
  end
end
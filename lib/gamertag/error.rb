module Gamertag
  # Custom error class for rescuing from Xbox Leader API errors which are
  # a little funky at best
  class Error < StandardError
    def initialize(response=nil)
      @response = response
      super(build_error_message)
    end

    private 
    def build_error_message
      return nil if @response.nil?
      "#{@response[:body].data.message}"
    end
  end

  class GamertagNotFound < Error; end
  class AchievementNotFound < Error; end
  class FriendsNotFound < Error; end
  class InvalidGamertag < Error; end
  class InvalidGameId < Error; end
end
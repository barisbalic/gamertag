require 'faraday'
require 'multi_json'

# @api private
module Faraday
  class Response::RaiseXboxLeadersError < Response::Middleware
    # Bit crappy but at the moment there's little to be done about it, I have
    # suggested to vendor that the API use HTTP response codes
    ERROR_MAP = {
      'The gameid supplied was not valid.' => Gamertag::InvalidGameId,
      'The gamertag supplied was not valid.' => Gamertag::InvalidGamertag,
      'The gamertag supplied does not exist on Xbox Live.' => Gamertag::GamertagNotFound,
      'The gamertag supplied has never played this game or does not exist on Xbox Live.' => Gamertag::AchievementNotFound,
      "No friends found, or friend's list is set to private." => Gamertag::FriendsNotFound
    }

    def on_complete(response)
      key = response[:body]['data']['message']
      raise ERROR_MAP[key].new(response) if ERROR_MAP.has_key? key
    end
  end
end
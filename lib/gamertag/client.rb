require 'gamertag/client/profile'
require 'gamertag/client/games'
require 'gamertag/client/friends'
require 'gamertag/client/achievements'

require 'gamertag/connection'

module Gamertag
  class Client
    attr_accessor(*Configuration::OPTION_KEYS)

    include Gamertag::Connection
    include Gamertag::Client::Profile
    include Gamertag::Client::Friends
    include Gamertag::Client::Games
    include Gamertag::Client::Achievements
  end
end

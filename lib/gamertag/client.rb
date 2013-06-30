require 'gamertag/connection'

require 'gamertag/client/profile'
require 'gamertag/client/games'
require 'gamertag/client/friends'
require 'gamertag/client/achievements'

module Gamertag
  class Client
    attr_accessor(*Configuration::OPTION_KEYS)

    def initialize(opts={})
      options = Gamertag.options.merge(opts)
      Configuration::OPTION_KEYS.each do |key|
        send("#{key}=", options[key])
      end
    end

    include Gamertag::Connection
    include Gamertag::Client::Profile
    include Gamertag::Client::Friends
    include Gamertag::Client::Games
    include Gamertag::Client::Achievements
  end
end

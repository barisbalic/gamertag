module Gamertag
  module MappingHelper
    def self.to_i
      lambda{|value| value.to_i }
    end
    
    def self.to_b
      lambda{|value| value == 'true' ? true : false }
    end
    
    def self.to_game_array
      lambda{|value| value.map {|k, v| v } }
    end
    
    MAPPINGS = {
      'reputation' => self.to_i,
      'is_cheater' => self.to_b,
      'online' => self.to_b,
      'gamerscore' => self.to_i,
      'recent_games' => self.to_game_array
    }
  
    def transform(key, value)
      MAPPINGS.keys.include?(key) ? MAPPINGS[key].call(value) : value
    end
  end
end

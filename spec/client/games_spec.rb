# -*- encoding: utf-8 -*-
require 'helper'

describe Gamertag::Client::Games do
  before do
    @client = Gamertag::Client.new
    @gamertag = 'belial1984'
  end

  describe '#games' do
    it 'returns the games that have been played by the gamertag' do
      stub_get('/games.json?gamertag=belial1984').
        to_return(json_response('games.json'))

      games = @client.games(@gamertag)
      expect(games.count).to eq(117)
    end
  end

  describe '#potential_gamerscore' do
    it 'returns the potential points the gamer could score from their library of games' do
      stub_get('/games.json?gamertag=belial1984').
        to_return(json_response('games.json'))

      potential_gamerscore = @client.potential_gamerscore(@gamertag)
      expect(potential_gamerscore).to eq(87770)
    end
  end

  describe '#potential_achievements_count' do
    it 'returns the number of potential achievements for the games played' do
      stub_get('/games.json?gamertag=belial1984').
        to_return(json_response('games.json'))

      potential_achievement_count = @client.potential_achievement_count(@gamertag)
      expect(potential_achievement_count).to eq(4165)
    end
  end

  describe '#achievements_count' do
    it 'returns the number of achievements for the games played' do
      stub_get('/games.json?gamertag=belial1984').
        to_return(json_response('games.json'))

      achievement_count = @client.achievement_count(@gamertag)
      expect(achievement_count).to eq(1054)
    end
  end
end
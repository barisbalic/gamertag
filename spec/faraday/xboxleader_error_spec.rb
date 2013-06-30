# -*- encoding: utf-8 -*-
require 'helper'

describe Faraday::Response do
  before do
    @client = Gamertag::Client.new
  end

  context 'when the friends are private or not found' do
    it 'raises a Gamertag::FriendsNotFound error' do
      stub_get('/friends.json?gamertag=belial1984').
        to_return(json_response('errors/friends_not_found.json'))

      expect { 
        @client.friends('belial1984')
        }.to raise_error(Gamertag::FriendsNotFound)
    end
  end

  context 'when the gamertag is invalid' do
    it 'raises a Gamertag::InvalidGamertag error' do
      stub_get('/profile.json?gamertag=InvalidGamertagHere').
        to_return(json_response('errors/invalid_gamertag.json'))

      expect { 
        @client.profile('InvalidGamertagHere')
        }.to raise_error(Gamertag::InvalidGamertag)
    end
  end

  context 'when the gamertag is not found' do
    it 'raises a Gamertag::InvalidGamertag error' do
      stub_get('/profile.json?gamertag=NoGamertagHere').
        to_return(json_response('errors/gamertag_not_found.json'))

      expect { 
        @client.profile('NoGamertagHere')
        }.to raise_error(Gamertag::GamertagNotFound)
    end
  end

  context 'when the game is not valid' do
    it 'raises a Gamertag::InvalidGameId error' do
      stub_get('/achievements.json?gameid=lemons&gamertag=belial1984').
        to_return(json_response('errors/invalid_game_id.json'))

      expect { 
        @client.achievements('belial1984', 'lemons')
        }.to raise_error(Gamertag::InvalidGameId)
    end
  end

  context 'when the game is not valid' do
    it 'raises a Gamertag::InvalidGameId error' do
      stub_get('/achievements.json?gamertag=belial1984&gameid=lemons').
        to_return(json_response('errors/invalid_game_id.json'))

      expect { 
        @client.achievements('belial1984', 'lemons')
        }.to raise_error(Gamertag::InvalidGameId)
    end
  end  
end
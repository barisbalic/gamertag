# -*- encoding: utf-8 -*-
require 'helper'

describe Gamertag::Client::Friends do
  before do
    @client = Gamertag::Client.new
    @gamertag = 'belial1984'
  end

  describe '#friends' do
    it 'returns friends for the gamertag' do
      stub_get('/friends.json?gamertag=belial1984').
        to_return(json_response('friends.json'))

      friends = @client.friends(@gamertag)

      expect(friends).not_to be_empty

      gamertags = friends.map{|f| f.gamertag }
      expect(gamertags).to include('Eternal Epoch')
    end
  end
end
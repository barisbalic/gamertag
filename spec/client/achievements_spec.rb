# -*- encoding: utf-8 -*-
require 'helper'

describe Gamertag::Client::Achievements do
  before do
    @client = Gamertag::Client.new
    @gamertag = 'belial1984'
  end

  describe '#achievements' do
    it 'should return the users achievements' do
      stub_get('/achievements.json?gameid=100&gamertag=belial1984').
        to_return(json_response('achievements.json'))


      achievements = @client.achievements(@gamertag, 100)

      expect(achievements.last.title).to eq('Scavenger Hunt')
    end
  end
end
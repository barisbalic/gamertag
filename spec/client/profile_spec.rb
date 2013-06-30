# -*- encoding: utf-8 -*-
require 'helper'

describe Gamertag::Client::Profile do
  before do
    @client = Gamertag::Client.new
    @gamertag = 'belial1984'
  end

  describe '#profile' do
    it 'returns the profile for the gamertag' do
      stub_get('/profile.json?gamertag=belial1984').
        to_return(json_response('profile.json'))


      profile = @client.profile(@gamertag)

      expect(profile.gamertag).to eq(@gamertag)
      expect(profile.name).to eq('baris balic')
    end
  end
end
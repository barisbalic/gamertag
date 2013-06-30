require 'helper'

describe Gamertag do
  after do
    Gamertag.defaults
  end

  describe '.new' do
    it 'is a Gamertag::Client' do
      expect(Gamertag.new).to be_a Gamertag::Client
    end
  end
end

require 'spec_helper'

describe Gamertag::Profile do
  use_vcr_cassette('SimpleProfile_Belial1984')
  use_vcr_cassette('PlayedGames_Belial1984')
  
  it "should return composite details" do  
    profile = Gamertag::Profile.new('Belial1984')

    profile.gamertag.should eql('belial1984')
    profile.online_status.include?('SUPER STREETFIGHTER IV').should eql(false)
    profile.recent_games.count.should eql(5)
    profile.played_games.count.should eql(88)
  end
end

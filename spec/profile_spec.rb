require 'spec_helper'

describe Gamertag::Profile do
  it "should return composite details" do
    profile = Gamertag::Profile.new('Belial1984')

    profile.gamertag.should eql('belial1984')
    profile.online_status.include?('SUPER STREETFIGHTER IV').should eql(true)
    profile.recent_games.count.should eql(5)
    profile.played_games.count.should eql(84)
  end
end

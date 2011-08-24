require 'spec_helper'

describe Gamertag::SimpleProfile, "#fetch" do
  it "should return profile data" do
    profile = Gamertag::SimpleProfile.new('Belial1984')
    profile.name.should =~ /baris balic/i
    profile.gamertag.should =~ /Belial1984/i
    profile.avatars.count.should eql(4)
    profile.avatars.small_gamerpic.should == 'http://avatar.xboxlive.com/avatar/belial1984/avatarpic-s.png'
  end
  
  it "should return the recent games data" do
    profile = Gamertag::SimpleProfile.new('Belial1984')
    profile.recent_games.count.should eql(5)
    profile.recent_games.first.title.should eql('Modern Warfare&#174; 2')
    profile.recent_games.first.available_gamerscore.should eql(1000)
    profile.recent_games.first.last_played.class.should == Time
  end
end
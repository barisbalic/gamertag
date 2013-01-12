require 'spec_helper'

describe Gamertag::Friends do
  use_vcr_cassette('Friends_Belial1984')
  
  it "should return all friends" do  
    profile = Gamertag::Friends.new('Belial1984')

    profile.friends.class.should be(Array)
    profile.friends.length.should eql(65)
  end
  
  it "should return online friends" do  
    profile = Gamertag::Friends.new('Belial1984')

    profile.online_friends.class.should be(Array)
    profile.online_friends.length.should eql(7)
  end
end
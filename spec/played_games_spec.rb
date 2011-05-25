require 'spec_helper'

describe Gamertag::PlayedGames do
  
  before(:each) do
  end
  
  it "should return played games" do
    played_games = Gamertag::PlayedGames.new('Belial1984')
    played_games.first.title.should eql("The Orange Box")
    played_games.count.should == 85
    played_games.each {|game| game.title.nil?.should be_false}
  end
end
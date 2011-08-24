# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Gamertag::PlayedGames do
  
  before(:each) do
  end
  
  it "should return played games" do
    played_games = Gamertag::PlayedGames.new('Belial1984')
    played_games.first.title.should eql("Modern Warfare® 2")
    played_games.count.should == 88
    played_games.each {|game| game.title.nil?.should be_false}
  end
end
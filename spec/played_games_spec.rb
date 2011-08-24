# -*- encoding: utf-8 -*-
require 'spec_helper'

describe Gamertag::PlayedGames do
  use_vcr_cassette('PlayedGames_Belial1984')
  
  it "should return played games" do  
    played_games = Gamertag::PlayedGames.new('Belial1984')

    played_games.first.title.should eql("Modern Warfare® 2")
    played_games.count.should == 88
    played_games.each {|game| game.title.nil?.should be_false}
    gamerscore_values = [:above_average, :below_average, :undefined]
    played_games.each do |game|
      gamerscore_values.should.include?(game.relative_gamerscore)
    end
  end
end
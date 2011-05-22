require 'spec_helper'

describe Gamertag::MappingHelper do
  include Gamertag::MappingHelper
  
  it "should map reputation to an integer" do
    transform('reputation', '100').should == 100
    transform('reputation', '100').should == 100
    transform('is_cheater', 'true').should == true
    transform('online', 'false').should == false
    transform('gamerscore', '10000').should == 10000
    recent_games = {'1' => {'title' => 'game'}, '2' => {'title' => 'better game'} }
    transform('recent_games', recent_games).should == [{'title' => 'game'}, {'title' => 'better game'}]
  end
end
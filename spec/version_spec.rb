require 'spec_helper'

describe Gamertag do
  it "should be the correct version" do
    Gamertag::VERSION.should == '1.0.2'
  end
end
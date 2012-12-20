require 'spec_helper'

describe Gamertag::SimpleProfile do
  describe "#fetch" do
    use_vcr_cassette('SimpleProfile_Belial1984')
  
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

  describe ".from_json" do
    let(:seed_data) {
      {
        "gamertag" => "laikal1",
        "is_valid" => 1,
        "profile_link"=>"http://live.xbox.com/member/laikal1",
        "launch_team"=>{"xbl"=>0, "nxe"=>0, "kinect"=>0},
        "account_status"=>"Gold",
        "gender"=>"Male",
        "is_cheater"=>0,
        "online"=>0,
        "online_status"=>"Last seen 9 hours ago playing Xbox.com",
        "avatars"=>{
          "gamer_tile"=>"http://avatar.xboxlive.com/avatar/laikal1/avatarpic-l.png",
          "small_gamerpic"=>"http://avatar.xboxlive.com/avatar/laikal1/avatarpic-s.png",
          "large_gamerpic"=>"http://avatar.xboxlive.com/avatar/laikal1/avatarpic-l.png",
          "body_gamerpic"=>"http://avatar.xboxlive.com/avatar/laikal1/avatar-body.png"
        },
        "reputation"=>85,
        "gamerscore"=>41646,
        "location"=>"Ann Arbor, MI",
        "motto"=>"Complexify!",
        "name"=>"Nyarlathotep (1 bucket)",
        "bio"=>"Design is how it works."
      }
    }
    it "should initialize a profile from json data without calling a remote service" do
      Net::HTTP.should_not_receive(:get_response)
      profile = Gamertag::SimpleProfile.from_json(seed_data.to_json)
      seed_data.keys.each do |k|
        profile.send(k).should == seed_data[k]
      end
    end
  end

end

# -*- encoding: utf-8 -*-
require 'helper'

describe Faraday::Response do
  before do
    @client = Gamertag::Client.new
    @gamertag = 'belial1984'
  end

  context 'when the profile is requested' do
    it "maps all crappy fields to snake_case" do
      stub_get("/profile.json?gamertag=#{@gamertag}").
        to_return(json_response('profile.json'))

      profile = @client.profile(@gamertag)
      expect(profile.gamertag).to eq('belial1984')

      expect(profile.badges.xbox_launch_team).to eq(false)
      expect(profile.badges.nxe_launch_team).to eq(false)
      expect(profile.badges.kinect_launch_team).to eq(false)
      expect(profile.recent_activity).not_to be_empty
      expect(profile.recent_activity.first.is_app).to eq(false)
      expect(profile.recent_activity.first.last_played).to eq('1370905190')

    end
  end

  context 'when the friends are requested' do
    it "maps all crappy fields to snake_case" do
      stub_get("/friends.json?gamertag=#{@gamertag}").
        to_return(json_response('friends.json'))

      friends = @client.friends(@gamertag)
      expect(friends.first.gamertag).to eq('Ageblaster')
      expect(friends.first.last_seen).to eq('1041379200')
    end
  end

  context 'when the games are requested' do
    it "maps all crappy fields to snake_case" do
      stub_get("/games.json?gamertag=#{@gamertag}").
        to_return(json_response('games.json'))

      games = @client.games(@gamertag)
      expect(games.first.is_app).to eq(false)
    end
  end

  context 'when the achievements are requested' do
    it "maps all crappy fields to snake_case" do
      stub_get("/achievements.json?gameid=100&gamertag=#{@gamertag}").
        to_return(json_response('achievements.json'))

      achievements = @client.achievements(@gamertag, 100)
      expect(achievements.first.unlock_date).to eq('1370919805')

   end
  end
end
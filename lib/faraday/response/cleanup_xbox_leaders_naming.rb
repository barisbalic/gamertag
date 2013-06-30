require 'faraday'
require 'multi_json'

# @api private
module Faraday
  class Response::CleanupXboxLeadersNaming < Response::Middleware
    MAPPINGS = {
      'xboxlaunchteam' => 'xbox_launch_team',
      'kinectlaunchteam' => 'kinect_launch_team',
      'nxelaunchteam' => 'nxe_launch_team',
      'recentactivity' => 'recent_activity',
      'isapp' => 'is_app',
      'lastplayed' => 'last_played',
      '"friend":' => '"gamertag":',
      'lastseen' => 'last_seen',
      'unlockdate' => 'unlock_date'
    }
    
    def initialize(app = nil, options = {})
      super(app)
    end
    
    def parse(body)
      MAPPINGS.each do |k,v|
        body.gsub!(k, v)
      end
      body
    end
  end
end
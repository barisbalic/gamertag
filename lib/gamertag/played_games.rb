module Gamertag
  class PlayedGames
    # Create a new instacne of +PlayedGames+ with a given gamertag. You will 
    # then be able to iterate over the items returned from xboxgamertag.com 
    # using iterator methods such as +first+, +last+, +each+, +count+, and
    # +to_hash+. 
    #
    # @param gamertag [String] XBOX gamertag to retrieve played games for.
    def initialize(gamertag)
      @played_games = fetch(gamertag)
    end
    
    # +first+, +last+, +each+, +count+, and +to_hash+ will be sent to the 
    # internal class variable holding the played games information.
    def method_missing(method_name, args = nil)
      [:first, :last, :each, :count, :to_hash].each {|method| return @played_games.send(method) if method_name == method }
      @played_games[method_name.to_s]
    end
    
    private

    # Fetch played game information for a given XBOX gamertag.
    #
    # @param gamertag [String] XBOX gamertag to retrieve played games for.
    #
    # @return A +Hashie::Mash+ of the "parsed" played game information.
    def fetch(gamertag)
      uri = URI.parse("http://www.xboxgamertag.com/search/#{gamertag}/")
      response = Net::HTTP.get_response(uri)
      document = Nokogiri::HTML(response.body)
      parse_rows(document)
    end
    
    # Parse the HTML from xboxgamertag.com to retrieve played game 
    # information such as title, earned_achievements, etc.
    #
    # @param document [Nokogiri::HTML] HTML document
    #
    # @return A +Hashie::Mash+ of the "parsed" played game information.
    def parse_rows(document)
      # Nasty HTML scraping hack, maybe pull into another class?
      document.css("[id='recentGamesTable']").css('tr').map do |table_row|
        cells = table_row.css('td')

        naming = cells[1].css("p")
        gamerscore = cells[2].css("div[class='percentage-container']").first.text.strip!.split('/')
        achievements = (cells[2].css("div[class='percentage-container']").last.text).strip!.split('/')
        
        average_gamerscore = cells[3].css('span').text.strip!
        relative_gamerscore = cells[3].css('span').attribute('title').text.include?('above average') ? :above_average : :below_average rescue :undefined

        Hashie::Mash.new({'image' => cells[0].css('img').attribute('src').text,
          'title' => naming.first.text,
          'last_played' => naming.last.text,
          'earned_gamerscore' => gamerscore.first,
          'available_gamerscore' => gamerscore.last,
          'earned_achievements' => achievements.first,
          'available_achievements' => achievements.last,
          'average_gamerscore' => average_gamerscore,
          'relative_gamerscore' => relative_gamerscore
        })
      end
    end
  end
end
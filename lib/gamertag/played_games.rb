module Gamertag
  class PlayedGames
    
    def initialize(gamertag)
      @played_games = fetch(gamertag)
    end
    
    def method_missing(method_name, args = nil)
      [:first, :last, :each, :count, :to_hash].each {|method| return @played_games.send(method) if method_name == method }
      @played_games[method_name.to_s]
    end
    
    private
    def fetch(gamertag)
      uri = URI.parse("http://www.xboxgamertag.com/search/#{gamertag}/")
      response = Net::HTTP.get_response(uri)
      document = Nokogiri::HTML(response.body)
      parse_rows(document)
    end
    
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
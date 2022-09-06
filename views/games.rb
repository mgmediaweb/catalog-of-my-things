require_relative './screens'

class GamesScreen < MainScreen
  def add_game
    header
    print "\n║  Add a new Game                                           ║"
    print "\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def list_games(data)
    header
    print "\n║  List of games                                            ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_game(data)
    footer
  end

  def loop_game(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  #{elem.title} (#{elem.author}) "
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                 -- No games availables --                 ║"
    end
  end
end

require_relative './screens'

class GamesScreen < MainScreen
  def admin_games
    header
    print "\n║  Games                                                    ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "#{blankline}\n║  [1] List of all Games                                    ║"
    print "\n║  [2] List all authors                                     ║"
    print "\n║  [3] Add a game                                           ║"
    print "\n║  [0] Exit.                                                ║"
    footer_empty
  end

  def add_game
    header
    print "\n║  Music albums: Add new                                    ║"
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

  def list_authors(data)
    header
    print "\n║  List of Authors                                          ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_author(data)
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

  def loop_author(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  #{elem.title} (#{elem.author}) "
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No authors availables --                ║"
    end
  end
end

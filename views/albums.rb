require_relative './screens'

class AlbumsScreen < MainScreen
  def add_album
    header
    print "\n║  Music albums: Add new                                    ║"
    print "\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def list_albums(data)
    header
    print "\n║  List of albums                                           ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_album(data)
    footer
  end

  def list_genres(data)
    header
    print "\n║  List of genres                                           ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_genre(data)
    footer
  end

  def loop_album(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  #{elem.title} (#{elem.author}) "
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No albums availables --                 ║"
    end
  end

  def loop_genre(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  #{elem.title} (#{elem.author}) "
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No genres availables --                 ║"
    end
  end
end

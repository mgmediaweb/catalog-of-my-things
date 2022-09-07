require_relative './screens'

class AlbumsScreen < MainScreen
  def add_album
    header
    print "\n║  Add a new Music Albums                                   ║"
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

  def loop_album(data)
    if data.length.positive?
      data.each do |elem|
        show_spotify = elem.spotify == 'Y' ? 'YES' : 'NO'

        line = "\n║  #{elem.title} (#{elem.author.first_name} #{elem.author.last_name}) - Spotify: #{show_spotify}"
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No albums availables --                 ║"
    end
  end
end

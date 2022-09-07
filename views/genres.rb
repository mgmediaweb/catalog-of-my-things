require_relative './screens'

class GenresScreen < MainScreen
  def list_genres(data)
    header
    print "\n║  List of genres                                           ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_genre(data)
    footer
  end

  def loop_genre(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  [#{elem.id}] #{elem.name}"
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No genres availables --                 ║"
    end
  end
end

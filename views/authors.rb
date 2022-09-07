require_relative './screens'

class AuthorsScreen < MainScreen
  def list_authors(data)
    header
    print "\n║  List of Authors                                          ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_author(data)
    footer
  end

  def loop_author(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  [#{elem.id}] #{elem.first_name} #{elem.last_name}"
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No authors availables --                ║"
    end
  end
end

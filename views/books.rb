require_relative './screens'

class BooksScreen < MainScreen
  def add_book
    header
    print "\n║  Books: Add new                                           ║"
    print "\n╚═══════════════════════════════════════════════════════════╝\n\n"
  end

  def list_books(data)
    header
    print "\n║  List of books                                            ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_book(data)
    footer
  end

  def loop_book(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  #{elem.title} (#{elem.author}) - #{elem.cover_state}"
        line += ' [Arch]' if elem.archived
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No books availables --                  ║"
    end
  end
end

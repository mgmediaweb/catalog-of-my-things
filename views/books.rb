require_relative './screens'

class BooksScreen < MainScreen
  def admin_books
    header
    print "\n║  Books                                                    ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "#{blankline}\n║  [1] List of all Books                                    ║"
    print "\n║  [2] List all labels                                      ║"
    print "\n║  [3] Add a new book                                       ║"
    print "\n║  [0] Exit.                                                ║"
    footer_empty
  end

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

  def list_labels(data)
    header
    print "\n║  List of labels                                           ║"
    print "\n╠═══════════════════════════════════════════════════════════╣"
    print "\n║                                                           ║"
    loop_label(data)
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

  def loop_label(data)
    if data.length.positive?
      data.each do |elem|
        line = "\n║  #{elem.title} (#{elem.author}) "
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No labels availables --                 ║"
    end
  end
end

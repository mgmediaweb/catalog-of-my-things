require_relative './screens'
require_relative './authors'
require_relative './genres'
require_relative './labels'

class BooksScreen < MainScreen
  def add_book(title, type = nil, array = nil)
    header
    line = "\n║  #{title}"
    print line
    print "#{whitespace(line.length)}║"
    if array
      print "\n╠═══════════════════════════════════════════════════════════╣"
      case type
      when 'authors'
        AuthorsScreen.new.loop_author(array)
      when 'genres'
        GenresScreen.new.loop_genre(array)
      when 'labels'
        LabelsScreen.new.loop_label(array)
      end
      print "\n║  [ 0 ] Add a new                                          ║"
    end
    footer_empty

    print '   Select a option number: ' if type
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
        line = "\n║  #{elem.title} (#{elem.author.first_name} #{elem.author.last_name}) - #{elem.cover_state}"
        line += ' [Arch]' if elem.archived
        print line
        print "#{whitespace(line.length)}║"
      end
    else
      print "\n║                -- No books availables --                  ║"
    end
  end
end

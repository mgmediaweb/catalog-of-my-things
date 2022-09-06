require_relative './views/screens'
require_relative './app'

def main
  screen = MainScreen.new
  @app = App.new

  loop do
    screen.initial
    print '   Select a option number, then press [ENTER]: '
    opc = gets.chomp.to_i
    break unless [1, 2, 3, 4, 5, 6, 7, 8, 9].include?(opc)

    if opc >= 1 && opc <= 6
      selector_list(opc)
    else
      selector_add(opc)
    end
  end
  screen.exit
end

def selector_add(opc)
  case opc
  when 7
    @app.add_book
  when 8
    @app.add_album
  when 9
    @app.add_game
  end
end

def selector_list(opc)
  case opc
  when 1
    @app.list_books
  when 2
    @app.list_albums
  when 3
    @app.list_games
  when 4
    @app.list_genres
  when 5
    @app.list_labels
  when 6
    @app.list_authors
  end
end

main

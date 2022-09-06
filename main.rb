require_relative './views/screens'
require_relative './app'

def main
  screen = MainScreen.new
  @app = App.new

  loop do
    screen.initial
    print '   Select a option number, then press [ENTER]: '
    opc = gets.chomp.to_i
    break unless [1, 2, 3].include?(opc)

    selector(opc)
  end
  screen.exit
end

def selector(opc)
  case opc
  when 1
    @app.books_admim
  when 2
    @app.albums_admin
  when 3
    @app.games_admin
  end
end

main

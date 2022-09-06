require_relative './io'
require_relative './book'
require_relative './label'
require_relative './views/albums'
require_relative './views/books'
require_relative './views/games'

class App
  def initialize
    @album_screen = AlbumsScreen.new
    @book_screen = BooksScreen.new
    @game_screen = GamesScreen.new

    @io_book = IOclass.new('books')
    @io_album = IOclass.new('albums')
    @io_game = IOclass.new('games')

    @album_list = []
    @authors_list = []
    @book_list = @io_book.read
    @game_list = []
    @genre_list = []
    @label_list = []
  end

  # OPTION 1
  def books_admim
    @book_screen.admin_books
    print '   Select a option number, then press [ENTER]: '
    book_selector(gets.chomp.to_i)
  end

  # OPTION 2
  def albums_admin
    @album_screen.admin_albums
    print '   Select a option number, then press [ENTER]: '
    album_selector(gets.chomp.to_i)
  end

  # OPTION 3
  def games_admin
    @game_screen.admin_games
    print '   Select a option number, then press [ENTER]: '
    game_selector(gets.chomp.to_i)
  end

  def album_selector(opc)
    case opc
    when 1
      list_albums
    when 2
      list_genres
    when 3
      add_album
    end
  end

  def game_selector(opc)
    case opc
    when 1
      list_games
    when 2
      list_authors
    when 3
      add_game
    end
  end

  def book_selector(opc)
    case opc
    when 1
      list_books
    when 2
      list_labels
    when 3
      add_book
    end
  end

  def list_albums
    @album_screen.list_albums(@album_list)
    gets.chomp
  end

  def list_authors
    @game_screen.list_authors(@authors_list)
    gets.chomp
  end

  def list_books
    @book_screen.list_books(@book_list)
    gets.chomp
  end

  def list_games
    @game_screen.list_games(@game_list)
    gets.chomp
  end

  def list_genres
    @album_screen.list_genres(@genre_list)
    gets.chomp
  end

  def list_labels
    @book_screen.list_labels(@label_list)
    gets.chomp
  end

  def add_album
    @album_screen.add_album
    print '   Enter a title: '
    title = gets.chomp.capitalize
    print '   Enter a author: '
    author = gets.chomp.capitalize
    print '   Enter a publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.capitalize
    print '   Is available on Spotify? [Y/N]: '
    spotify = gets.chomp.upcase

    # modify this section
    # @album_list << Album.new(
    #   title, author, publish_date, spotify
    # )
    @io_album.write(@album_list)
    goback
  end

  def add_game
    @game_screen.add_game
    print '   Enter a title: '
    title = gets.chomp.capitalize
    print '   Enter a author: '
    author = gets.chomp.capitalize
    print '   Enter a publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.capitalize
    print '   Is multiplayer? [Y/N]: '
    multiplayer = gets.chomp.upcase

    # modify this section
    # @game_list << Game.new(
    #   title, author, publish_date, multiplayer
    # )
    @io_game.write(@game_list)
    goback
  end

  def add_book
    @book_screen.add_book
    print '   Enter a title: '
    title = gets.chomp.capitalize
    print '   Enter a author: '
    author = gets.chomp.capitalize
    print '   Enter a publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.capitalize
    print '   Enter a publisher: '
    publisher = gets.chomp.capitalize
    print "   Enter a cover state:\n   [1] = Good, [2] = Regular, [3] = Bad: "
    cover_state = gets.chomp.to_i

    cover_quality = %w[unknow good regular bad]

    @book_list << Book.new(
      title, author, publish_date, publisher, cover_quality[cover_state]
    )
    @io_book.write(@book_list)
    goback
  end

  def goback
    @book_screen.success
    sleep(2)
  end
end

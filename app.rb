require_relative './io'
require_relative './book'
require_relative './views/albums'
require_relative './views/authors'
require_relative './views/books'
require_relative './views/games'
require_relative './views/genres'
require_relative './views/labels'

class App
  def initialize
    @control = Control.new
    @cover_quality = %w[unknow good regular bad]

    @album_screen = AlbumsScreen.new
    @author_screen = AuthorsScreen.new
    @book_screen = BooksScreen.new
    @game_screen = GamesScreen.new
    @genre_screen = GenresScreen.new
    @label_screen = LabelsScreen.new

    @io_album = IOclass.new('albums')
    @io_author = IOclass.new('authors')
    @io_book = IOclass.new('books')
    @io_game = IOclass.new('games')
    @io_genre = IOclass.new('genres')
    @io_label = IOclass.new('labels')

    @album_list = @io_album.read
    @author_list = @io_author.read
    @book_list = @io_book.read
    @game_list = @io_game.read
    @genre_list = @io_genre.read
    @label_list = @io_label.read
  end

  def list_books
    @book_screen.list_books(@book_list)
    gets.chomp
  end

  def list_albums
    @album_screen.list_albums(@album_list)
    gets.chomp
  end

  def list_games
    @game_screen.list_games(@game_list)
    gets.chomp
  end

  def list_genres
    @genre_screen.list_genres(@genre_list)
    gets.chomp
  end

  def list_labels
    @label_screen.list_labels(@label_list)
    gets.chomp
  end

  def list_authors
    @author_screen.list_authors(@author_list)
    gets.chomp
  end

  def add_book
    @book_screen.add_book('Add a new Book')
    print '   Enter a title: '
    title = gets.chomp.capitalize
    print '   Enter a publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.strip
    print '   Enter a publisher: '
    publisher = gets.chomp.strip.capitalize
    print "   Enter a cover state:\n   [1] = Good, [2] = Regular, [3] = Bad: "
    cover_state = gets.chomp.to_i

    get_author = handle_author
    get_genre = handle_genre
    get_label = handle_label

    new_book = Book.new(
      title, get_author, publish_date, publisher,
      @cover_quality[cover_state], get_label, get_genre
    )

    @book_list << new_book unless @book_list.include?(new_book)
    @io_book.write(@book_list)
    goback
  end

  def handle_author
    @book_screen.add_book('Select Author', 'authors', @author_list)
    author = gets.chomp.to_i

    if author.zero?
      get_author = @control.select_author
      @author_list << get_author
      @io_author.write(@author_list)
    else
      get_author = @control.find_array(author, @author_list)
    end

    get_author
  end

  def handle_genre
    @book_screen.add_book('Select Genre', 'genres', @genre_list)
    genre = gets.chomp.to_i

    if genre.zero?
      get_genre = @control.select_genre
      @genre_list << get_genre
      @io_genre.write(@genre_list)
    else
      get_genre = @control.find_array(genre, @genre_list)
    end

    get_genre
  end

  def handle_label
    @book_screen.add_book('Select Label', 'labels', @label_list)
    label = gets.chomp.to_i

    if label.zero?
      get_label = @control.select_label
      @label_list << get_label
      @io_label.write(@label_list)
    else
      get_label = @control.find_array(label, @label_list)
    end

    get_label
  end

  def add_album
    @album_screen.add_album
    print '   Enter a title: '
    title = gets.chomp.strip.capitalize
    print '   Enter a author: '
    author = gets.chomp.strip.capitalize
    print '   Enter a publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.strip
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
    title = gets.chomp.strip.capitalize
    print '   Enter a author: '
    author = gets.chomp.strip.capitalize
    print '   Enter a publish date (YYYY-MM-DD): '
    publish_date = gets.chomp.strip
    print '   Is multiplayer? [Y/N]: '
    multiplayer = gets.chomp.strip.upcase

    # modify this section
    # @game_list << Game.new(
    #   title, author, publish_date, multiplayer
    # )
    @io_game.write(@game_list)
    goback
  end

  def goback
    @book_screen.success
    sleep(2)
  end
end

class Control
  def initialize
    @album_screen = AlbumsScreen.new
    @author_screen = AuthorsScreen.new
    @book_screen = BooksScreen.new
    @game_screen = GamesScreen.new
    @genre_screen = GenresScreen.new
    @label_screen = LabelsScreen.new
  end

  def find_array(id, arr)
    arr.find { |item| item.id == id }
  end

  def select_author
    @book_screen.add_book('Add Author')
    print '   Enter first name: '
    author_first_name = gets.chomp.strip.capitalize
    print '   Enter last name: '
    author_last_name = gets.chomp.strip.capitalize
    Author.new(nil, author_first_name, author_last_name)
  end

  def select_genre
    @book_screen.add_book('Add Gender')
    print '   Enter name: '
    genre = gets.chomp.strip.capitalize
    Genre.new(nil, genre)
  end

  def select_label
    @book_screen.add_book('Add Label')
    print '   Enter a title: '
    label_title = gets.chomp.strip.capitalize
    print '   Enter a color: '
    label_color = gets.chomp.strip.capitalize
    Label.new(nil, label_title, label_color)
  end
end

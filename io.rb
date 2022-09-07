require 'json'
require_relative './album'
require_relative './author'
require_relative './book'
require_relative './game'
require_relative './genre'
require_relative './label'

class IOclass
  def initialize(opc)
    @io_write = IOwrite.new
    @type = opc

    @file = case @type
            when 'albums'
              './json/albums.json'
            when 'authors'
              './json/authors.json'
            when 'books'
              './json/books.json'
            when 'games'
              './json/games.json'
            when 'genres'
              './json/genres.json'
            when 'labels'
              './json/labels.json'
            else
              './json/default.json'
            end
  end

  # READ =======================================================
  def read
    file = File.open(@file, 'a+')
    file_data = file.read
    arr_items = []

    if file_data != ''
      elems = JSON.parse(file_data)
      arr_items = make_object(elems)
    end

    close(file)
    arr_items
  end

  # WRITE ======================================================
  def write(elems)
    file = File.open(@file, 'w')
    File.write(@file, JSON.pretty_generate(make_array(elems)))
    close(file)
  end

  def make_array(elems)
    arr_items = []
    elems.each { |item| arr_items << make_array_detail(item) }
    arr_items
  end

  def make_array_detail(obj)
    case @type
    when 'albums'
      @io_write.create_obj_album(obj)
    when 'authors'
      @io_write.create_obj_author(obj)
    when 'books'
      @io_write.create_obj_book(obj)
    when 'games'
      @io_write.create_obj_game(obj)
    when 'genres'
      @io_write.create_obj_genre(obj)
    when 'labels'
      @io_write.create_obj_label(obj)
    end
  end

  def make_object(elems)
    arr_items = []

    elems.each do |item|
      arr_items << make_selector(item)
    end

    arr_items
  end

  def make_selector(obj)
    case @type
    when 'albums'
      new_album(obj)
    when 'authors'
      new_author(obj)
    when 'books'
      new_book(obj)
    when 'games'
      new_game(obj)
    when 'genres'
      new_genre(obj)
    when 'labels'
      new_label(obj)
    end
  end

  def new_album(obj)
    obj['author'] = new_author(obj['author'])
    obj['label'] = new_label(obj['label'])
    obj['genre'] = new_genre(obj['genre'])

    Album.new(
      obj['title'], obj['author'], obj['publish_date'],
      obj['spotify'], obj['label'], obj['genre'], obj['id']
    )
  end

  def new_author(obj)
    Author.new(obj['id'], obj['first_name'], obj['last_name'])
  end

  def new_book(obj)
    obj['author'] = new_author(obj['author'])
    obj['label'] = new_label(obj['label'])
    obj['genre'] = new_genre(obj['genre'])

    Book.new(
      obj['title'], obj['author'], obj['publish_date'], obj['publisher'],
      obj['cover_state'], obj['label'], obj['genre'], obj['id']
    )
  end

  def new_game(obj)
    obj['author'] = new_author(obj['author'])
    obj['label'] = new_label(obj['label'])
    obj['genre'] = new_genre(obj['genre'])

    Game.new(
      obj['title'], obj['multiplayer'], obj['last_played_at'],
      obj['publish_date'], obj['author'],
      obj['genre'], obj['label'], obj['id']
    )
  end

  def new_genre(obj)
    Genre.new(obj['id'], obj['name'])
  end

  def new_label(obj)
    Label.new(obj['id'], obj['title'], obj['color'])
  end

  def close(file)
    file.close
  end
end

class IOwrite
  def create_obj_album(obj)
    {
      'id' => obj.id, 'title' => obj.title,
      'publish_date' => obj.publish_date, 'spotify' => obj.spotify,
      'genre' => {
        'id' => obj.genre.id,
        'name' => obj.genre.name
      },
      'label' => {
        'id' => obj.label.id,
        'title' => obj.label.title,
        'color' => obj.label.color
      },
      'author' => {
        'id' => obj.author.id,
        'first_name' => obj.author.first_name,
        'last_name' => obj.author.last_name
      }
    }
  end

  def create_obj_author(obj)
    print " ----> #{obj}"
    {
      'id' => obj.id,
      'first_name' => obj.first_name,
      'last_name' => obj.last_name
    }
  end

  def create_obj_book(obj)
    {
      'id' => obj.id, 'title' => obj.title,
      'publish_date' => obj.publish_date,
      'publisher' => obj.publisher, 'cover_state' => obj.cover_state,
      'genre' => {
        'id' => obj.genre.id,
        'name' => obj.genre.name
      },
      'label' => {
        'id' => obj.label.id,
        'title' => obj.label.title,
        'color' => obj.label.color
      },
      'author' => {
        'id' => obj.author.id,
        'first_name' => obj.author.first_name,
        'last_name' => obj.author.last_name
      }
    }
  end

  def create_obj_game(obj)
    {
      'id' => obj.id, 'title' => obj.title,
      'publish_date' => obj.publish_date,
      'multiplayer' => obj.multiplayer,
      'last_played_at' => obj.last_played_at,
      'genre' => {
        'id' => obj.genre.id,
        'name' => obj.genre.name
      },
      'label' => {
        'id' => obj.label.id,
        'title' => obj.label.title,
        'color' => obj.label.color
      },
      'author' => {
        'id' => obj.author.id,
        'first_name' => obj.author.first_name,
        'last_name' => obj.author.last_name
      }
    }
  end

  def create_obj_genre(obj)
    {
      'id' => obj.id, 'name' => obj.name
    }
  end

  def create_obj_label(obj)
    {
      'id' => obj.id,
      'title' => obj.title,
      'color' => obj.color
    }
  end
end

require 'json'
require_relative './book'

class IOclass
  def initialize(opc)
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

  def write(elems)
    file = File.open(@file, 'w')
    File.write(@file, JSON.pretty_generate(make_array(elems)))
    close(file)
  end

  def make_array(elems)
    arr_items = []
    elems.each { |item| arr_items << array_fill(item) }
    arr_items
  end

  def array_fill(item)
    case @type
    when 'albums'
      {
        'id' => item.id, 'title' => item.title,
        'author' => item.author, 'publish_date' => item.publish_date,
        'spotify' => item.spotify
      }
    when 'authors'
      {
        'id' => item.id,
        'first_name' => item.first_name,
        'last_name' => item.last_name
      }
    when 'books'
      {
        'id' => item.id, 'title' => item.title,
        'author' => item.author, 'publish_date' => item.publish_date,
        'publisher' => item.publisher, 'cover_state' => item.cover_state
      }
    when 'games'
      {
        'id' => item.id, 'title' => item.title,
        'author' => item.author, 'publish_date' => item.publish_date,
        'multiplayer' => item.multiplayer
      }
    end
  end

  def make_object(elems)
    arr_items = []

    elems.each do |item|
      case @type
      when 'books'
        arr_items << Book.new(
          item['title'], item['author'], item['publish_date'], item['publisher'], item['cover_state'], item['id']
        )
      when 'albums'
        arr_items << Album.new(
          item['title'], item['author'], item['publish_date'], item['spotify'], item['id']
        )
      when 'games'
        arr_items << Game.new(
          item['title'], item['author'], item['publish_date'], item['multiplayer'], item['id']
        )
      end
    end

    arr_items
  end

  def close(file)
    file.close
  end
end

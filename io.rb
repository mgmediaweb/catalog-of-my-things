require 'json'
require_relative './book'
require_relative './music_album'

class IOclass
  def initialize(arg)
    @type = arg

    @file = case @type
            when 'books'
              './json/books.json'
            when 'albums'
              './json/albums.json'
            when 'games'
              './json/games.json'
            else
              './json/default.json'
            end
  end

  def read
    file = File.open(@file)
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
    when 'books'
      {
        'id' => item.id, 'title' => item.title,
        'author' => item.author, 'publish_date' => item.publish_date,
        'publisher' => item.publisher, 'cover_state' => item.cover_state
      }
    when 'albums'
      {
        'name' => item.name, 'on_spotify' => item.on_spotify
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
        arr_items << MusicAlbum.new(
          item['name'], item['on_spotify']
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

<<<<<<< HEAD
require_relative './item'
require 'date'

class Game < Item
  attr_accessor :multiplayer, :last_played_at, :publish_date, :archived

  def initialize(title, multiplayer, last_played_at, publish_date, author, genre, label, id = nil)
    super(publish_date, archived: archived)
    @title = title
    @multiplayer = multiplayer
    @last_played_at = last_played_at
    add_author(author)
    add_genre(genre)
    add_label(label)
  end  

  def can_be_archived?
    @archieved = Time.new.year - Date.parse(@last_played_at)
    return true if super || @archieved > 2
  
     false
    end
=======
require 'date'
require_relative './item'

class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at, :publish_date, :archived

  def initialize(
    title,
    multiplayer,
    last_played_at,
    publish_date,
    author,
    genre,
    label,
    id = nil
  )
    super(id, publish_date)

    my_date = last_played_at.split('-')
    @title = title
    @multiplayer = multiplayer
    @last_played_at = Date.new(my_date[0].to_i, my_date[1].to_i, my_date[2].to_i)

    add_author(author)
    add_genre(genre)
    add_label(label)
  end

  def can_be_archived?
    return true if super || ((DateTime.now - @last_played_at) / 365).to_i > 2

    false
>>>>>>> d7ad1bbe28b98bfaf5f537d0297492d3786cf176
  end
end

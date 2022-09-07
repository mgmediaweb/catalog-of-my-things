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
  end
end

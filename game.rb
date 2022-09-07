require 'date'
require_relative './item'

class Game < Item
  attr_accessor :title, :multiplayer, :last_played_at, :publish_date

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
    # return true if super || ((DateTime.now - @last_played_at) / 365).to_i > 2

    false
  end
end

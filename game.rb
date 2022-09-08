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

    @title = title
    @multiplayer = multiplayer
    @last_played_at = Date.parse(last_played_at)

    add_author(author)
    add_genre(genre)
    add_label(label)
  end

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).to_i > 2

    false
  end
end

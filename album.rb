require_relative './item'

class Album < Item
  attr_accessor :title, :spotify

  def initialize(
    title,
    author,
    publish_date,
    spotify,
    label,
    genre,
    id = nil
  )
    super(id, publish_date)

    @title = title
    @publish_date = publish_date
    @spotify = spotify

    add_author(author)
    add_genre(genre)
    add_label(label)
  end

  private

  def can_be_archived?
    return true if super || @on_spotify == true

    false
  end
end

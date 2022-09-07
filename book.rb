require_relative './item'

class Book < Item
  attr_accessor :title, :cover_state, :publisher

  def initialize(
    title,
    author,
    publish_date,
    publisher,
    cover_state,
    label,
    genre,
    id = nil
  )
    super(id, publish_date)

    @title = title
    @publish_date = publish_date
    @publisher = publisher
    @cover_state = cover_state

    add_author(author)
    add_genre(genre)
    add_label(label)
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end

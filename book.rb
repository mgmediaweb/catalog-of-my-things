require_relative './item'

class Book < Item
  attr_accessor :title, :author, :publish_date, :publisher, :cover_state

  def initialize(
    title,
    author,
    publish_date,
    publisher,
    cover_state,
    label = nil,
    genre = nil,
    id = nil
  )
    super(id, publish_date, author, label, genre)

    @title = title
    @publish_date = publish_date
    @publisher = publisher
    @cover_state = cover_state
  end

  private

  def can_be_archived?
    return true if super || @cover_state == 'bad'

    false
  end
end

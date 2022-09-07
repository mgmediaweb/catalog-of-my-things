require_relative './item'

class Album < Item
  attr_accessor :title, :author, :publish_date, :publisher, :cover_state

  def initialize(
    title,
    author,
    publish_date,
    publisher,
    cover_state,
    id = nil
  )
    super(id, publish_date)

    @title = title
    @author = author
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

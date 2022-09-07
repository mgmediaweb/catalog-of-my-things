require 'date'

class Item
  attr_reader :archived, :id
  attr_accessor :author, :genre, :label, :publish_date

  def initialize(id, publish_date)
    my_date = publish_date.split('-')
    @id = id || Random.rand(1..999)
    @archived = false
    @publish_date = Date.new(my_date[0].to_i, my_date[1].to_i, my_date[2].to_i)
    move_to_archive
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author(author)
    author.add_item(self)
    @author = author
  end

  def add_genre(genre)
    genre.add_item(self)
    @genre = genre
  end

  def add_label(label)
    label.add_item(self)
    @label = label
  end

  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).to_i > 10

    false
  end
end

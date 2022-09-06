require 'date'
require_relative './label'
require_relative './author'

class Item
  attr_reader :archived, :id
  attr_accessor :author, :genre, :label, :publish_date

  def initialize(id, publish_date, author, label, genre)
    my_date = publish_date.split('-')

    @id = id || Random.rand(1..999)
    @archived = false
    @author = author
    @genre = genre
    @label = label
    @publish_date = Date.new(my_date[0].to_i, my_date[1].to_i, my_date[2].to_i)

    print "author: #{@author}"

    move_to_archive
    add_author
  end

  def move_to_archive
    @archived = true if can_be_archived?
  end

  def add_author
    author_names = @author.split
    new_author = Author.new(
      nil,
      author_names[0],
      author_names[1]
    )
    new_author.add_item
  end

  private

  def can_be_archived?
    return true if ((DateTime.now - @publish_date) / 365).to_i > 10

    false
  end
end

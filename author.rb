require_relative './io'

class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(1..999)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item
    # item.author = self
    #@io_author = IOclass.new('authors')
    @items << self unless @items.include?(self)
    #@authors_list << self unless @items.include?(self)

    # @io_author.write(self)
    p @items
    p @authors_list
  end
end

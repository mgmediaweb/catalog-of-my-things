<<<<<<< HEAD
require_relative './item'

class Author < Item
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  def initialize(first_name, last_name)
    super()
    @id = Random.rand(1..1000)
=======
class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(100..999)
>>>>>>> d7ad1bbe28b98bfaf5f537d0297492d3786cf176
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
<<<<<<< HEAD
    item.author = self
=======
>>>>>>> d7ad1bbe28b98bfaf5f537d0297492d3786cf176
  end
end

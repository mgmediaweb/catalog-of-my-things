require_relative './item'

class Author < Item
  attr_reader :id
  attr_accessor :first_name, :last_name, :items

  super()
  @id = Random.rand(1..1000)
  @first_name = first_name
  @last_name = last_name
  @items = []

  def add_item(item)
    @items.push(item)
    item.author = self
  end
end

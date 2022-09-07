class Genre
  attr_accessor :name
  attr_reader :id

  def initialize(id, name)
    @id = id || Random.rand(100..999)
    @name = name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
  end
end

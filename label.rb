class Label
  attr_reader :id, :items
  attr_accessor :title, :color

  def initialize(id, title, color)
    @id = id || Random.rand(1..999)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    item.label = self
    @items << item unless @items.include?(item)
  end
end

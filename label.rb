class Label
  attr_accessor :title, :color
  attr_reader :id

  def initialize(id, title, color)
    @id = id || Random.rand(100..999)
    @title = title
    @color = color
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
  end
end

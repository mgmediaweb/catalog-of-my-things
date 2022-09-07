class Author
  attr_accessor :first_name, :last_name, :items
  attr_reader :id

  def initialize(id, first_name, last_name)
    @id = id || Random.rand(100..999)
    @first_name = first_name
    @last_name = last_name
    @items = []
  end

  def add_item(item)
    @items << item unless @items.include?(item)
  end
end

require_relative './author'

describe Author do
  before(:each) do
    @author = Author.new('Yesmake', 'Worku')
    @item = Item.new(2010, archived: false)
  end

  context '#initialize' do
    it 'Should create an instance of the author' do
      expect(@author).to be_an_instance_of Author
    end

    it 'Crate a new instance of the author' do
      expect(@author).to be_a(Author)
    end

    it 'Expects to add item to items array' do
      @author.add_item(@item)
      expect(@author.items.length).to eq 1
    end

    it 'Should add add an item to an author' do
      author = Author.new('Hadis', 'Alemayehu')
      game1 = Game.new('Tennis', '2022-09-06', '2022-09-06')
      game2 = Game.new('Tennis', '2022-09-06', '2022-09-06')
      author.add_item(game1)
      author.add_item(game2)
      expect(author.items).to eql [game1, game2]
    end
  end
end

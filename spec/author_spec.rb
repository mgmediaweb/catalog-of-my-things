require_relative '../author'

describe Author do
  before(:each) do
    @author = Author.new(207, 'Yesmake', 'Worku')
  end

  context '#initialize' do
    it 'Should create an instance of the author' do
      expect(@author).to be_an_instance_of Author
    end

    it 'Create a new instance of the author' do
      expect(@author).to be_a(Author)
    end

    it 'Expects to add item to items array' do
      @author.add_item(@item)
      expect(@author.items.length).to eq 1
    end
  end
end

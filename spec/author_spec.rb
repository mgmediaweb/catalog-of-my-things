require_relative './author_spec'

describe Author do
  before(:each) do 
    @author = Author.new('Yesmake', 'Worku')
    @item = Item.new(2010, archived: false)
  end
  context '#initialize' do 
    it 'Should create an instance of the author' do 
    expect (@author).to be_an_instance_of Author

    it 'Crate a new instance of the author' do
      expect(@author).to be_a(Author)
    end
    
    it 'Expects to add item to items array' do 
      @author.add_item(@item)
    expect(@author.items.length).to eq 1
    end
  end
end
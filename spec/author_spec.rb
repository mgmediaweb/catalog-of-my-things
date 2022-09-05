require_relative './author_spec'

describe Author do
  before(:each) do 
    @author = Author.new('Yesmake', 'Worku')
    @item = Item.new(2010, archived: false)
  end
  context '#initialize' do 
    it '' do 

    end
    
    it 'Expects to add item to items array' do 
      @author.add_item(@item)
    expect(@author.items.length).to eq 1
    end
  end
end
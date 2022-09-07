require_relative '../label'
require_relative '../book'

describe Label do
  before :each do
    @label = Label.new('Wazi Buda', 'red')
    @book = Book.new('Love my country', '2015-04-21', 'bad')
  end

  it 'Should contain these properties' do
    expect(@label.title).to eq('Wazi Buda')
    expect(@label.color).to eq('red')
  end

  it 'Should include the item' do
    expect(@label.add_item(@book)).to include(@book)
  end
end
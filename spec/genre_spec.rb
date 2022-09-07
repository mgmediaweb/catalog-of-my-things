require_relative '../genre'

describe Genre do
  before :all do
    @genre = Genre.new('1', 'Pop')
  end

  it 'should take `genre name parameter` and return Genre Object()' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'should `return the name` of the Genre' do
    expect(@genre.name).to eq('Pop')
  end
end

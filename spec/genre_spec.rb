require_relative '../genre'
require_relative '../album'

describe Genre do
  before :all do
    @music_album = Album.new('My love to Kenya', '2014-09-12', true)
    @genre = Genre.new('Pop')
  end

  it 'should take `genre name parameter` and return Genre Object()' do
    expect(@genre).to be_an_instance_of Genre
  end

  it 'should `return the name` of the Genre' do
    expect(@genre.name).to eq('Pop')
  end

  it 'should `add the music album` to the Genre' do
    expect(@genre.add_item(@music_album)).to include(@music_album)
  end
end

require 'date'
require_relative '../album'
require_relative '../author'
require_relative '../genre'
require_relative '../label'

describe Album do
  before :each do
    @author = Author.new(204, 'Yesmake', 'Worku')
    @genre = Genre.new(204, 'fiction')
    @label = Label.new(204, 'Dertogada', 'blue')
    @music_album = Album.new('Peeling the Mask', @author, '2022-05-01', 'Y', @label, @genre)
  end

  it 'should return a correct album name' do
    expect(@music_album.title).to eq('Peeling the Mask')
  end

  it 'should return a publish date' do
    expect(@music_album.publish_date).to eq('2022-05-01')
  end

  it 'should return false if music album is not on spotify' do
    expect(@music_album.spotify).to eq('Y')
  end

end

require 'date'
require_relative '../album'

describe MusicAlbum do
  before :each do
    @music_album = Album.new('Peeling the Mask', '2010-10-25', false)
  end

  it 'should return a correct album name' do
    expect(@music_album.name).to eq('Peeling the Mask')
  end

  it 'should return a publish date' do
    expect(@music_album.publish_date).to eq(Date.parse('2010-10-25'))
  end

  it 'should return false if music album is not on spotify' do
    expect(@music_album.on_spotify).to eq(false)
  end

  it 'should return false if can be archived method is false' do
    expect(@music_album.can_be_archived?).to eq(false)
  end
end

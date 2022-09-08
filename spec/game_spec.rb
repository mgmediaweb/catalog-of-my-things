require_relative '../game'
require_relative '../author'
require_relative '../label'
require_relative '../genre'

describe Game do
  before(:each) do
    @author = Author.new(204, 'Addisu', 'Haile')
    @genre = Genre.new(204, 'War')
    @label = Label.new(204, 'Best sellers', 'Red')
    @game = Game.new('Domino', 'Y', '2013-11-24', '2014-10-12', @author, @genre, @label)
  end

  it 'Returns properties with getter' do
    expect(@game.title).to eq('Domino')
    expect(@game.multiplayer).to eq 'Y'
    expect(@game.last_played_at).to eq Date.parse('2013-11-24')
  end
end

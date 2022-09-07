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

  it 'Crate a new instance of Game' do
    expect(@game.title).to eq('Domino')
  end

  it 'Returns properties with getter' do
    expect(@game.multiplayer).to eq 'Y'
    expect(@game.last_played_at).to eq Date.parse('2013-11-24')
  end

  # it 'can_be_achieved? return false if @last_played_at is < 2' do
  #   expert(@game.archived).to eq false
  # end
end

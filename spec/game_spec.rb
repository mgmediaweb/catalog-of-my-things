require_relative '../game'
require_relative '../author'
require_relative '../label'
require_relative '../genre'

describe Game do
  before(:each) do
    @author = Author.new(204, 'Addisu', 'Haile')
    @genre = Genre.new(204, 'War')
    @label = Label.new(204, 'Best sellers', 'Red')
    @game1 = Game.new('Domino', 'Y', '2013-05-09', 'BirhanPlc', 'good', @author, @label, @genre)
    @game2 = Game.new('Cheese', 'N', '2011-05-11', 'WillyPlc', 'bad', @author, @label, @genre)
  end

  it 'Crate a new instance of Game' do
    expect(@game1).to be_a(Game)
  end

  # it 'Returns properties with getter' do
  #   expect(@game1.multiplayer).to eq 'Y'
  #   expect(@game1.last_played_at).to eq '2021-09-04'
  # end

  # it 'can_be_achieved? return false if @last_played_at is < 2' do
  #   expect(@game1.can_be_achieved?).to eq false
  # end
end

require_relative './game'

describe Game do
  before(:each) do
    @game1 = Game.new(true, 2021, 2015, false)
    @game2 = Game.new(true, 2020, 2015, false)
  end

  it 'Crate a new instance of Game' do
    expect(@game1).to be_a(Game)
  end

  it 'Returns properties with getter' do
    expect(@game1.multiplayer).to eq true
    expect(@game1.last_played_at).to eq 2021
  end

  it 'can_be_achieved? return false if @last_played_at is < 2' do
    expect(@game1.can_be_achieved?).to eq false
  end
end
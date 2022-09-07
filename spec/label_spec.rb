require_relative '../label'
require_relative '../book'

describe Label do
  before :each do
    @label = Label.new('2', 'Wazi Buda', 'red')
  end

  it 'Should contain these properties' do
    expect(@label.title).to eq('Wazi Buda')
    expect(@label.color).to eq('red')
  end

end
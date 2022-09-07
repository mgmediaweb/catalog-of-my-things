require_relative './book' 

describe Book do 
  before(:each) do 
    @book = Book.new('The sign and the seal', '2022-09-06')

  end

  context "#initialize" do 
    it '#initialize' do 
      
    end
  end
end
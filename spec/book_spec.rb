require_relative '../book'
require_relative '../author'
require_relative '../genre'
require_relative '../label'

describe Book do
  before(:each) do
    @author = Author.new(204, 'Yesmake', 'Worku')
    @genre = Genre.new(204, 'fiction')
    @label = Label.new(204, 'Dertogada', 'blue')
    @book = Book.new('Dertogada', @author, '2018-05-12', 'BirhanPlc', 'good', @label, @genre)
  end

  context 'Create a book instance' do
    it 'Return the right data' do
      expect(@book.title).to eq('Dertogada')
      expect(@book.publish_date).to eq('2018-05-12')
      expect(@book.publisher).to eq('BirhanPlc')
      expect(@book.cover_state).to eq('good')
    end

    it 'Take title and author' do
      book2 = Book.new('Fiker Eske Mekaber', @author, '2019-06-10', 'WillyPlc', 'good', @label, @genre)
      expect(book2.title).to eq 'Fiker Eske Mekaber'
      expect(book2.publisher).to eq 'WillyPlc'
    end

    it 'should detect the book title' do
      @book3 = Book.new('Emegua', @author, '2014-07-09', 'BirhanPlc', 'bad', @label, @genre)
      expect(@book3.title).to eq 'Emegua'
    end
  end
end

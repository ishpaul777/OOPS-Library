require_relative '../classes/book'

describe Book do
  context 'When testing the Book class' do
    it 'Initialized with author and title' do
      book = Book.new('Book1', 'john Doe')
      title = book.title
      author = book.author
      expect(title).to eq 'Book1'
      expect(author).to eq 'john Doe'
    end
  end
end

require_relative './book'

class Books
  attr_reader :list

  def initialize
    @list = []
  end

  def list_all_books
    @list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_a_book
    print 'Title: '
    title = gets.chomp

    print 'Author: '
    author = gets.chomp

    @list << Book.new(title, author)

    puts 'Book created successfully!'
  end
end

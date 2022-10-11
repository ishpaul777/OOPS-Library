require_relative './book'
require 'json'

class Books
  attr_reader :list

  def initialize
    @list = []
    get_books
  end

  def get_books
    # add code here
    books = JSON.parse(File.read('Data/books.json'))
    # for every book create a new book from author an title
    books.map do |book|
      newBook = Book.new(book['title'], book['author'])
      # newBook.rentals = book['rentals']
      @list << newBook
    end 
  end

  def list_all_books
    puts 'OOPS Library# List of Books ->'
    @list.each { |book| puts "Title: #{book.title}, Author: #{book.author}" }
  end

  def create_a_book(data)
    print 'OOPS Library# Title: '
    title = gets.chomp

    print 'OOPS Library# Author: '
    author = gets.chomp

    newBook = Book.new(title, author)
    @list << newBook
    data.addBook(newBook)

    puts 'OOPS Library# Book created successfully!'
  end
end

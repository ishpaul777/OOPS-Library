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

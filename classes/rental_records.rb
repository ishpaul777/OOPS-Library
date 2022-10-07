require_relative './Association/rentals'

class RentalRecords
  attr_reader :list

  def initialize
    @list = []
  end

  def create_rental(books, members)
    puts 'OOPS Library# Select a book from the following list by index'
    books.each_with_index { |book, i| puts "#{i + 1}-> Title: #{book.title}, Author: #{book.author}" }
    index = gets.to_i
    book = books[index - 1]

    puts 'OOPS Library# Select a person from the following list by index'
    members.each_with_index do |member, i|
      puts "#{i + 1} -> [#{member.class}] Name: #{member.name}, ID: #{member.id}, Age: #{member.age}"
    end
    index = gets.to_i
    person = members[index - 1]

    print 'OOPS Library# Date: '
    date = gets.chomp

    rental = Rental.new(date, person, book)
    @list << rental

    puts 'OOPS Library# Rental created successfully'
  end

  def list_all_rentals_for_person_id(members)
    print 'OOPS Library# ID of person: '
    id = gets.chomp.to_i

    person = members.select { |member| member.id == id }

    if (person.length.empty?)
      puts "OOPS Library# No me,ber found by Id -> #{id}"
    else
      puts 'OOPS Library# All Rental by the person-'
      person[0].rentals.each do |r|
        puts "Date: #{r.date}, Book -> #{r.book.title} by #{r.book.author}"
      end
    end
  end
end

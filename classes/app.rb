require_relative 'person'
require_relative './decorator/capitalize'
require_relative './decorator/trim'
require_relative './books'
require_relative './members'
require_relative './rental_records'

class App
  def initialize(members = Members.new, books = Books.new, classrooms = Classrooms.new,
                 rental_records = RentalRecords.new)
    @members = members
    @books = books
    @classrooms = classrooms
    @rental_records = rental_records
  end

  def process(input)
    case input
    when 1
      if @books.list.empty?
        puts 'OOPS Library# Sorry no books in library. Create a book!'
      else
        @books.list_all_books
      end
    when 2
      if @members.list.empty?
        puts 'OOPS Library# Sorry no members. Create a member!'
      else
        @members.list_all_members
      end
    when 3
      @members.create_member(@classrooms)
    when 4
      @books.create_a_book
    when 5
      if @books.list.empty?
        puts 'OOPS Library# Sorry no books in library. Create a book!'
      elsif @members.list.empty?
        puts 'OOPS Library# Sorry no members. Create a member!'
      else
        @rental_records.create_rental(@books.list, @members.list)
      end
    when 6
      @rental_records.list_all_rentals_for_person_id(@members.list)
    end
  end
end

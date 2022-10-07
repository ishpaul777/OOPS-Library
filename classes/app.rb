require_relative 'person'
require_relative './decorator/capitalize'
require_relative './decorator/trim'
require_relative './books'
require_relative './members'
require_relative './rental_records'

class App
  def initialize(members = Members.new, books = Books.new, classrooms = Classrooms.new,
                 rental_records = Rental_records.new)
    @members = members
    @books = books
    @classrooms = classrooms
    @rental_records = rental_records
  end

  def process(input)
    case input
    when 1
      if (@books.list.length == 0)
        puts 'OOPS Library# Sorry no books in library. Create a book!'
      else
        @books.list_all_books
      end
    when 2
      if (@members.list.length == 0)
        puts 'OOPS Library# Sorry no members. Create a member!'
      else
        @members.list_all_members
      end
    when 3
      @members.create_member(@classrooms)
    when 4
      @books.create_a_book
    when 5
      if (@books.list.length == 0)
        puts 'OOPS Library# Sorry no books in library. Create a book!'
      elsif (@members.list.length == 0)
        puts 'OOPS Library# Sorry no members. Create a member!'
      else
        @rental_records.create_rental(@books.list, @members.list)
      end
    when 6
      @rental_records.list_all_rentals_for_person_id(@members.list)
    end
  end
end

# person = Person.new(17, "ishPaul", parent_permission: false)

# puts person.can_use_services?

# puts person.correct_name

# capitalizedPerson = CapitalizeDecorator.new(person)
# puts capitalizedPerson.correct_name

# capitalizedTrimmedPerson = TrimmerDecorator.new(capitalizedPerson)
# puts capitalizedTrimmedPerson.correct_name

# classroom1 = Classroom.new("10A")
# stdnt1 = Student.new(classroom1, 19, "raj", parent_permission: false)
# puts stdnt1.parent_permission
# puts stdnt1.classroom.label
# puts classroom1.students[0].name

# book = Book.new("harry potter", 'JK Rowling')
# rental = Rental.new("2/11/22", person, book)

# puts person.rentals[0].date
# puts person.rentals[0].book.title

# puts book.rentals[0].person.name

# puts rental.person.name
# puts rental.book.title

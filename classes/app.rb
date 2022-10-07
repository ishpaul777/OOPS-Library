require_relative 'person'
require_relative './decorator/capitalize'
require_relative './decorator/trim'
require_relative './books'
require_relative './Association/rentals'
require_relative './members'
# require_relative '../main.rb'
class App
  def initialize(members = Members.new, books = Books.new, classrooms = Classrooms.new)
    @members = members
    @books = books
    @classrooms = classrooms
  end

  def process(input)
    case input
    when 1
      @books.list_all_books
    when 2
      @members.list_all_members
    when 3
      @members.create_member(@classrooms)
    when 4
      @books.create_a_book
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

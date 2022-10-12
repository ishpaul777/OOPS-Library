require_relative '..\classes\student'
require_relative '..\classes\Association\classroom'
require_relative '..\classes\Association\rentals'
require_relative '..\classes\book'
describe Student do
  context 'When testing the Rental class' do
    classroom = Classroom.new('9-A')
    student = Student.new(classroom, 19, 'john', 1, parent_permission: false)
    book = Book.new('Book1', 'john Doe')
    rental = Rental.new('22/2/22', student, book)
    it 'Initialized with person, book, date' do
      name = rental.person.name
      book = rental.book.title
      date = rental.date
      expect(date).to eq '22/2/22'
      expect(book).to eq 'Book1'
      expect(name).to eq 'john'
    end
    it 'student has the rental reflect in it' do
      expect(student.rentals[0]).to be rental
    end
  end
end

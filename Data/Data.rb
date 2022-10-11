class Data
  def initialize
    @books = JSON.parse(File.read('data/books.json'))
    @students = JSON.parse(File.read('data/students.json'))
    @teachers = JSON.parse(File.read('data/teachers.json'))
    @rental_records = JSON.parse(File.read('data/rental_records.json'))
  end

  def addBook(book)
    # creat obj to push
    obj = {
      "title": book.title,
      "author": book.author
    }
    # push it to the book json obj
    @books << obj
    # override
    File.write('data/books.json', JSON.generate(@books))
  end

  def add_student(student)
    obj = {
      "classroom": student.classroom.label,
      "id": student.id,
      "name": student.name,
      "age": student.age,
      "parent_permission": student.parent_permission
    }
    @students << obj
    # override
    File.write('data/students.json', JSON.generate(@students))
  end

  def add_teacher(teacher)
    obj = {
      "id": teacher.id,
      "name": teacher.name,
      "age": teacher.age,
      "specialization": teacher.specialization
    }

    @teachers << obj
    # override
    File.write('data/teachers.json', JSON.generate(@teachers))
  end

  def add_rental(rental)
    obj = {
      "date": rental.date, "member_name": rental.person.name, "member_id": rental.person.id, "book": rental.book.title
    }
    @rental_records << obj
    File.write('data/rental_records.json', JSON.generate(@rental_records))
  end
end

require_relative './person'

class Student < Person
  def initialize(classroom, age, name = 'unknown', id = nil, parent_permission: true)
    super(age, id, name, parent_permission: parent_permission)
    @classroom = classroom
    add_classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def add_classroom
    @classroom.add_student(self)
  end

  attr_accessor :classroom
end

require_relative './person'

class Student < Person
  def initialize(classroom, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  attr_accessor :classroom
end

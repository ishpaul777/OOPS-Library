require_relative './classroom'

class Classrooms
  attr_accessor :list

  def initialize
    @list = []
  end

  def create_classroom(label)
    @list << Classroom.new(label)
  end
end

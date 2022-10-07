require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @specialization = specialization
  end

  # overides to return true
  def can_use_services?
    true
  end

  # getters and setters
  attr_accessor :specialization
end

require_relative './person'

class Teacher < Person
  def initialize(specialization, age, name = 'Unknown', parent_permission: true)
    super(age, parent_permission, name)
    @specialization = specialization
  end

  # overides to return true
  def can_use_services?
    true
  end

  # getters and setters
  attr_accessor :specialization
end

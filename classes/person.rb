require_relative './nameable'

class Person < Nameable
  def initialize(age, name = 'unknown', id, parent_permission: true)
    super()
    @id = id == nil ? Random.rand(1..100) : id
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  def add_rental(rental)
    rentals.push(rental)
  end
  # getters and setters
  attr_reader :id, :parent_permission
  attr_accessor :name, :age, :rentals

  # private method
  private

  def of_age?
    @age >= 18
  end
end

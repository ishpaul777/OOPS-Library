class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  # getters and setters
  attr_reader :id, :parent_permission
  attr_accessor :name, :age

  # private method
  private

  def of_age?
    @age >= 18
  end
end

# person1 = Person.new(19, "Ishpaul", false)

# puts person1.can_use_services?

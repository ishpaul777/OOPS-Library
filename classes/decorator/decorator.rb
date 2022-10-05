require_relative '../nameable'

class Decorator < Nameable
  def initialize(nameable)
    @nameable = nameable
    super()
  end

  # override
  def correct_name
    @nameable.correct_name
  end
end

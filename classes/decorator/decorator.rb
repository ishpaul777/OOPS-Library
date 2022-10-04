require_relative '../nameable.rb'

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

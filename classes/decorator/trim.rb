require_relative './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    res = @nameable.correct_name
    res.length <= 10 ? res : res[0...10]
  end
end

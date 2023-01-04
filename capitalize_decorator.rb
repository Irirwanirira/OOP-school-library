require_relative 'base_decorator'

class CapitilizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitilize
  end
end

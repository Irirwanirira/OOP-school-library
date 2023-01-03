require_relative 'person'

class Nameable
  def correct_name
    raise NotImplementedError, 'not implemented'
  end
end

class BaseDecorator < Nameable
  atrr_accessor :nameable

  def initilize(nameable)
    super()
    @nameable = nameable
  end

  def correct_name
    @nameable.correct_name
  end
end

class CapitilizeDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name.capitilize
  end
end

class TrimmerDecorator < BaseDecorator
  def correct_name
    @nameable.correct_name[0, 10]
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
